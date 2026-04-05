resource "aws_apigatewayv2_api" "this" {
    name        = "serverless-api"
    protocol_type = var.bucket_name
}

