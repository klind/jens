variable "aws_region" {
  description = "AWS region for main resources"
  type        = string
  default     = "us-west-2"
}

variable "domain_name" {
  description = "Primary domain name"
  type        = string
  default     = "toemrerjustesen.dk"
}

variable "bucket_name" {
  description = "S3 bucket name for website"
  type        = string
  default     = "toemrerjustesen-prod-website"
}
