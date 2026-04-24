variable "bucket_name" {
  description = "S3 bucket name"
  type        = string
}

variable "lambda_role_arn" {
  description = "IAM role ARN for Lambda"
  type        = string
}

variable "domain_name" {
  description = "Domain name for ACM + CloudFront"
  type        = string
}