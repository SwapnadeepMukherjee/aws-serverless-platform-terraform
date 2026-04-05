module "s3" {
    source = "D:\Career\Personal_Study_Data\Github_Master\aws-serverless-platform-terraform\terrraform\modules\s3"
    bucket_name = var.bucket_name
}

module "lambda" {
  source        = "D:\Career\Personal_Study_Data\Github_Master\aws-serverless-platform-terraform\terrraform\modules\lambda"
  function_name = "aws-serverless-platform-terraform-lambda"
  role_arn      = var.lambda_role_arn
  filename      = "D:\Career\Personal_Study_Data\Github_Master\aws-serverless-platform-terraform\app\lambda.zip"
}

module "api" {
  source = "D:\Career\Personal_Study_Data\Github_Master\aws-serverless-platform-terraform\terrraform\modules\api_gateway"
}

module "dynamodb" {
  source     = "D:\Career\Personal_Study_Data\Github_Master\aws-serverless-platform-terraform\terraform\modules\dynamodb"
  table_name = "serverless-table"
}

module "acm" {
  source      = "D:\Career\Personal_Study_Data\Github_Master\aws-serverless-platform-terraform\terraform\modules\acm"
  domain_name = var.domain_name
}

module "cloudfront" {
  source           = "D:\Career\Personal_Study_Data\Github_Master\aws-serverless-platform-terraform\terraform\modules\cloudfront"
  api_gateway_url  = module.api.api_endpoint
  acm_arn          = module.acm.certificate_arn
}