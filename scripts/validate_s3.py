import boto3

def validate_s3_bucket(bucket_name):
    s3 = boto3.client('s3')
    try:
        buckets = s3.list_buckets()
        if bucket_name in [bucket['Name'] for bucket in buckets['Buckets']]:
            print(f"Buckets '{bucket_name}' exists and is accessible.")
        else:
            print(f"Bucket '{bucket_name}' does not exist.")
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    validate_s3_bucket("my-bucket")