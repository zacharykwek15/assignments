resource "aws_iam_policy" "temp_user_policy" {
    name = "zh-temp-user1"
    description = "Creating permission for temp user role for EC2, S3 & RDS"

    policy = jsonencode({
        Version = "2012-10-17",
        Statement =[
            #EC2: Create, view and delete
            {
                Sid = "EC2Permissions",
                Effect = "Allow",
                Action = [
                    "ec2:RunInstances",
                    "ec2:DescribeInstances",
                    "ec2:TerminateInstances",
                    "ec2:StartInstances",
                    "ec2:StopInstances"
                ],
                Resource = "*"
            },
            #S3: Create and View
            {
                Sid = "S3Permissions",
                Effect = "Allow",
                Action = [
                    "s3:CreateBucket",
                    "s3:ListAllMyBuckets",
                    "s3:GetBucketLocation",
                    "s3:ListBucket"
                ],
                Resource = "*"
            },
        
        #EDS: View Only 
        {   
            Sid = "RDSPermissions",
            Effect = "Allow",
            Action = [
                "rds:DescribeDBInstances"
            ],
            Resource = "*"
        }

        ]
    })
}