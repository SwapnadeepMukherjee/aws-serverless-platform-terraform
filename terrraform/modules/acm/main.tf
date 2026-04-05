resource "aws_acm-certificates" "this" {
    domain_name        = var.domain_name
    validation_method  = "DNS"
}