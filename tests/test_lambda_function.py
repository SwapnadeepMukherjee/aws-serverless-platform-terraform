import json

from lambda_function import lambda_handler


def test_lambda_handler_returns_200_with_expected_message():
    response = lambda_handler({}, None)

    assert response["statusCode"] == 200
    assert json.loads(response["body"])["message"] == "Hello from Zero-Cost AWS Project 🚀"
