resource "aws_iam_role" "temp_user_role" {
    name = "zh-temp-user1"

    assume_role_policy =  jsonencode({
        Version = "2012-10-17",
        Statement = [{
            Effect = "Allow",
            Principal = {
                Service ="ec2.amazonaws.com"
            },
            Action = "sts:AssumeRole"
        }]

    })
}