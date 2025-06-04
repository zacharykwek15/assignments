resource "aws_iam_role" "dynamodb_read_role" {
    name = "zh-temp-user"
    assume_role_policy = jsonencode({
        Version = "2012-10-17",
        Statement = [
            {
                Effect = "Allow",
                Principal = {
                    Service = "ec2.amazonaws.com"
                },
                Action = "sts:AssumeRole"
                }
        ]
    })
}

