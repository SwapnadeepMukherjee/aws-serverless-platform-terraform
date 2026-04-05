terraform {
    backend "s3" {
        bucket = "aws-serverless-platform-terraform"
        key = "dev/terraform.tfstate"
        region = "ap-south-1"
    }
}