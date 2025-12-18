#!/bin/bash

# Import existing AWS resources into Terraform state
# Run this ONCE after 'terraform init'

set -e

echo "Importing existing AWS resources into Terraform..."

# ACM Certificate FIRST (us-east-1) - needed before CloudFront
echo "Importing ACM certificate..."
terraform import aws_acm_certificate.website arn:aws:acm:us-east-1:961855985303:certificate/5e094ed2-4cd2-4006-b6b0-0d846454d6ba

# S3 Bucket
echo "Importing S3 bucket..."
terraform import aws_s3_bucket.website toemrerjustesen-prod-website

# S3 Public Access Block
echo "Importing S3 public access block..."
terraform import aws_s3_bucket_public_access_block.website toemrerjustesen-prod-website

# S3 Bucket Policy
echo "Importing S3 bucket policy..."
terraform import aws_s3_bucket_policy.website toemrerjustesen-prod-website

# CloudFront Distribution
echo "Importing CloudFront distribution..."
terraform import aws_cloudfront_distribution.website EMY9JM5WARPC9

# Route 53 Records
ZONE_ID="Z00863683R5RB0J86Q95V"

echo "Importing Route 53 A record (apex)..."
terraform import aws_route53_record.apex "${ZONE_ID}_toemrerjustesen.dk_A"

echo "Importing Route 53 A record (www)..."
terraform import aws_route53_record.www "${ZONE_ID}_www.toemrerjustesen.dk_A"

echo "Importing Route 53 MX record..."
terraform import aws_route53_record.mx "${ZONE_ID}_toemrerjustesen.dk_MX"

echo "Importing Route 53 TXT record (SPF)..."
terraform import aws_route53_record.txt_spf "${ZONE_ID}_toemrerjustesen.dk_TXT"

echo "Importing Route 53 DMARC record..."
terraform import aws_route53_record.dmarc "${ZONE_ID}__dmarc.toemrerjustesen.dk_TXT"

echo "Importing Route 53 DKIM records..."
terraform import aws_route53_record.dkim_ed1 "${ZONE_ID}_ed1._domainkey.toemrerjustesen.dk_CNAME"
terraform import aws_route53_record.dkim_rsa1 "${ZONE_ID}_rsa1._domainkey.toemrerjustesen.dk_CNAME"

echo ""
echo "Import complete! Run 'terraform plan' to verify."
