module "s3" {
    source = "../../modules/s3"
    bucket_name = var.bucket_name
}

module "lambda" {
  source        = "../../modules/lambda"
  function_name = "aws-serverless-platform-terraform-lambda"
  role_arn      = var.lambda_role_arn
  filename      = "../../app/lambda.zip"
}

module "api" {
  source = "../../modules/api_gateway"
}

module "dynamodb" {
  source     = "../../modules/dynamodb"
  table_name = "serverless-table"
}

module "acm" {
  source      = "../../modules/acm"
  domain_name = var.domain_name
}

module "cloudfront" {
  source           = "../../modules/cloudfront"
  api_gateway_url  = module.api.api_endpoint
  acm_arn          = module.acm.certificate_arn
}