resource "aws_iam_policy" "dynamodb_read_policy" {
    name = "zh-temp-user"
    description = "creation of policy to create,read and delete in DyanmoDB "
    policy = jsonencode ({
        Version = "2012-10-17"
        Statement =[
            {
                Action = [
                    "dynamodb:BatchGetItem",
                    "dynamodb:GetItem",
                    "dynamodb:Query",
                    "dynamodb:Scan",
                    "dynamodb:DescribeTable",
                    "dynamodb:ListTables"
                ]
                Effect = "Allow"
                Resource = "arn:aws:dynamodb:ap-southeast-1:255945442255:table/zh-bookinventory"
            }
        ]
    })
}

