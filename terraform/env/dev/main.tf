module "s3" {
  source      = "../../modules/s3"
  bucket_name = var.bucket_name
}

module "lambda" {
  source        = "../../modules/lambda"
  function_name = "aws-serverless-platform-terraform-lambda"
  role_arn      = var.lambda_role_arn
}

module "api" {
  source               = "../../modules/api_gateway"
  lambda_invoke_arn    = module.lambda.invoke_arn
  lambda_function_name = module.lambda.function_name
}

module "dynamodb" {
  source     = "../../modules/dynamodb"
  table_name = "serverless-table"
}

module "cloudfront" {
  source          = "../../modules/cloudfront"
  api_gateway_url = replace(module.api.api_endpoint, "https://", "")
}