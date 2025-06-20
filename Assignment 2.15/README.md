1) What is needed to Authorize your EC2 to retrieve secrets from the AWS secret manager?
    - IAM role attached to the EC2 instance, IAM policy allowing secretsmanager:GetSecretValue for the specific secret. We can also restrict access to only the required secret using its ARN.


2) Derive the IAM policy (Json)
    {
        "Version":"2012-10-17",
        "Statement":[
            {
                "Effect": "Allow",
                "Action":[
                    "secretsmanager:GetSecretValue"
                ],
                "Resource":"arn:aws:secretsmanager:ap-southeast-1:m3l415072023:secret:prod/cart-service/credentials-*"
            }
        ]
    }

3) Using the secret name prod/cart-service/credentials, derive a sensible ARN as the specific resource for access.
    - Using a wild card "*" 
        - arn:aws:secretsmanager:ap-southeast-1:m3l415072023:secret:prod/cart-service/credentials-*"
