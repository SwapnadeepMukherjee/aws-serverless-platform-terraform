resource "aws_acm-certificate" "this" {
    domain_name        = var.domain_name
    validation_method  = "DNS"
}