data "archive_file" "lambda_zip" {
  type        = "zip"
  source_dir  = "${path.module}/../../../app"
  output_path = "${path.module}/../../../app/lambda.zip"
}

resource "aws_lambda_function" "this" {
  function_name = var.function_name
  role          = var.role_arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.13"

  filename         = data.archive_file.lambda_zip.output_path
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256
}