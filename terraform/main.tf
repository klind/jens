# =============================================================================
# S3 Bucket for Website
# =============================================================================

resource "aws_s3_bucket" "website" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_public_access_block" "website" {
  bucket = aws_s3_bucket.website.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# =============================================================================
# CloudFront Origin Access Control (import existing: EC629HE0G0ZWT)
# =============================================================================

data "aws_cloudfront_origin_access_control" "website" {
  id = "EC629HE0G0ZWT"
}

# =============================================================================
# S3 Bucket Policy for CloudFront
# =============================================================================

resource "aws_s3_bucket_policy" "website" {
  bucket = aws_s3_bucket.website.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "AllowCloudFrontServicePrincipal"
        Effect    = "Allow"
        Principal = {
          Service = "cloudfront.amazonaws.com"
        }
        Action   = "s3:GetObject"
        Resource = "${aws_s3_bucket.website.arn}/*"
        Condition = {
          StringEquals = {
            "AWS:SourceArn" = aws_cloudfront_distribution.website.arn
          }
        }
      }
    ]
  })
}

# =============================================================================
# ACM Certificate (must be in us-east-1 for CloudFront)
# =============================================================================

resource "aws_acm_certificate" "website" {
  provider          = aws.us_east_1
  domain_name       = var.domain_name
  subject_alternative_names = ["www.${var.domain_name}"]
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

# =============================================================================
# Route 53 Hosted Zone (data source - already exists)
# =============================================================================

data "aws_route53_zone" "main" {
  name         = var.domain_name
  private_zone = false
}

# =============================================================================
# ACM Certificate Validation DNS Records
# These already exist and are managed outside Terraform (created by ACM)
# We reference them but don't manage them to avoid import issues
# =============================================================================

resource "aws_acm_certificate_validation" "website" {
  provider        = aws.us_east_1
  certificate_arn = aws_acm_certificate.website.arn
}

# =============================================================================
# CloudFront Distribution
# =============================================================================

locals {
  s3_origin_id = "${var.bucket_name}.s3.us-west-2.amazonaws.com-mj9t9c2dbvm"
}

resource "aws_cloudfront_distribution" "website" {
  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = "index.html"
  aliases             = [var.domain_name, "www.${var.domain_name}"]
  price_class         = "PriceClass_All"
  web_acl_id          = "arn:aws:wafv2:us-east-1:961855985303:global/webacl/CreatedByCloudFront-ef9591b9/06449d28-5df6-4fa9-9aa8-a7db1385ef42"

  tags = {
    Name = "toemrerjustensen"
  }

  origin {
    domain_name              = aws_s3_bucket.website.bucket_regional_domain_name
    origin_id                = local.s3_origin_id
    origin_access_control_id = data.aws_cloudfront_origin_access_control.website.id
  }

  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = local.s3_origin_id
    viewer_protocol_policy = "redirect-to-https"
    compress               = true
    cache_policy_id        = "658327ea-f89d-4fab-a63d-7e88639e58f6"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn      = aws_acm_certificate.website.arn
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1.2_2021"
  }

  depends_on = [aws_acm_certificate_validation.website]
}

# =============================================================================
# Route 53 DNS Records for CloudFront
# =============================================================================

resource "aws_route53_record" "apex" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.website.domain_name
    zone_id                = aws_cloudfront_distribution.website.hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = "www.${var.domain_name}"
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.website.domain_name
    zone_id                = aws_cloudfront_distribution.website.hosted_zone_id
    evaluate_target_health = false
  }
}

# =============================================================================
# Email/External DNS Records (MX, SPF, DKIM, DMARC)
# =============================================================================

resource "aws_route53_record" "mx" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = var.domain_name
  type    = "MX"
  ttl     = 300
  records = ["10 coss4t4nt.mx.service.one"]
}

resource "aws_route53_record" "txt_spf" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = var.domain_name
  type    = "TXT"
  ttl     = 300
  records = [
    "google-site-verification=eFCU6s4KLlBCNL1JzMp1dBVw6XCmZxJpeAyszyPW4rE",
    "v=spf1 include:_custspf.one.com ~all"
  ]
}

resource "aws_route53_record" "dmarc" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = "_dmarc.${var.domain_name}"
  type    = "TXT"
  ttl     = 300
  records = ["v=DMARC1; p=none; rua=mailto:dmarc@toemerrjustesen.dk; fo=1"]
}

resource "aws_route53_record" "dkim_ed1" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = "ed1._domainkey.${var.domain_name}"
  type    = "CNAME"
  ttl     = 14400
  records = ["ed1.dkim.coss4t4nt.service.one"]
}

resource "aws_route53_record" "dkim_rsa1" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = "rsa1._domainkey.${var.domain_name}"
  type    = "CNAME"
  ttl     = 14400
  records = ["rsa1.dkim.coss4t4nt.service.one"]
}
