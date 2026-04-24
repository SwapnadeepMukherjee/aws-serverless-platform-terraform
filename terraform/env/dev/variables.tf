env:
    TF_VAR_bucket_name: ${{ sercrets.BUCKET_NAME}}
    TF_VAR_lambda_role_arn: ${{ secrets.LAMBDA_ROLE_ARN}}
    TF_VAr-domain_name: ${{ secrets.DOMAIN_NAME }}
