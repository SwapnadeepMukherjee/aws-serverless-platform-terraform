# aws-serverless-platform-terraform
This is a AWS Serverless Project created using Terraform

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
  - `env/dev/variables.tf` - Environment-level input variables (`bucket_name`, `lambda_role_arn`, `domain_name`)

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
- Fully serverless (zero-cost design intent)
- Infrastructure as Code, split into reusable modules
- CI/CD pipeline scaffold (GitHub Actions)

## Known Limitations / Work in Progress
This is a learning project and is **not yet end-to-end functional**. Current gaps:
- API Gateway is provisioned but has no route/integration to the Lambda function yet — the API doesn't call the function.
- The ACM certificate is created in `ap-south-1` with no DNS validation records. CloudFront requires certs in `us-east-1`, and currently uses the CloudFront default certificate instead of the ACM one — the ACM module isn't actually wired in.
- No automated tests exist yet; the test step in CI is disabled.
- S3/DynamoDB don't yet have encryption, versioning, or point-in-time recovery configured.
- IAM roles/policies are supplied externally (via `lambda_role_arn`), not managed in this repo.

## How to Run
1. `cd terraform/env/dev`
2. `terraform init`
3. `terraform apply` (requires `TF_VAR_bucket_name`, `TF_VAR_lambda_role_arn`, `TF_VAR_domain_name` to be set)

Note: apply currently succeeds but the deployed stack is not yet functional end-to-end — see Known Limitations above.
