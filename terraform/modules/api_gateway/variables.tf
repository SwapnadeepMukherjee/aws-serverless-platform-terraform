variable "api_name" {
  description = "Name of the API Gateway"
  type        = string
  default     = "serverless-api"
}

variable "lambda_invoke_arn" {
  description = "Invoke ARN of the Lambda function to integrate with"
  type        = string
}

variable "lambda_function_name" {
  description = "Name of the Lambda function to integrate with"
  type        = string
}