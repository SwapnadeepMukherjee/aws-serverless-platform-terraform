import json

def lambda_handler(event, context):
    print("Received event: " + json.dumps(event, indent=2))
    return {
        'statusCode': 200,
        'body': json.dumps({"message": "Hello from Zero-Cost AWS Project 🚀"})
    }