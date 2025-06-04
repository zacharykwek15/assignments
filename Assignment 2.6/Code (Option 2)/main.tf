
#Attaching Policy to the Role
resource "aws_iam_role_policy_attachment" "temp_user_attach" {
    role = aws_iam_role.temp_user_role.name
    policy_arn =  aws_iam_policy.temp_user_policy.arn

}

#Create the Instance Profile for the EC2
#This is to attach IAM role to an EC2
resource "aws_iam_instance_profile" "temp_user_profile" {
    name = "zh-temp-user"
    role = aws_iam_role.temp_user_role.name
}

#Launching an EC2 instance
resource "aws_instance" "zh_ec2" {
    ami = "ami-0afc7fe9be84307e4" #Go to launch instance in EC2 and look under 64-bit
    instance_type = "t2.micro"

    iam_instance_profile = aws_iam_instance_profile.temp_user_profile.name

    tags = {
        Name = "zh-temp-user"
    } 

}