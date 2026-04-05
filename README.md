# aws-serverless-platform-terraform
This is a AWS Serverlesss Project created using Terraform

## Tech Stack:

- AWS Lambda
- API Gateway
- S3
- DynamoDB
- CLoudFront
- ACM
- Terraform
- GitHub Actions
- Python

# Project strucuture:

Main Terraform configuration directory for infrastructure as code.

- **`modules/`** - Reusable Terraform modules
  - `lambda/` - AWS Lambda function module
  - `api_gateway/` - API Gateway module
  - `s3/` - S3 bucket module
  - `dynamodb/` - DynamoDB module
  - `cloudfront/` - CloudFront module
  - `acm/` - ACM module

- **`env/dev/`** - Environment-specific configurations for development

- **Core files:**
  - `backend.tf` - Terraform state backend configuration
  - `provider.tf` - AWS provider configuration
  - `variables.tf` - Global variables

### `/app`
Application code for AWS Lambda functions.

- `lambda_function.py` - Main Lambda function implementation
- `requirements.txt` - Python dependencies

### `/scripts`
Utility scripts for deployment and validation.

- `validate_s3.py` - S3 validation script

### `/.github/workflows`
GitHub Actions CI/CD pipeline configuration.

- `deploy.yml` - Deployment workflow

### Root files
- `.gitignore` - Git ignore rules
- `README.md` - Project documentation


## Features
- Fully serverless (zero-cost design)
- Infrastructure as Code
- CI/CD pipeline
- Secure IAM practices

## How to Run
1. terraform init
2. terraform apply