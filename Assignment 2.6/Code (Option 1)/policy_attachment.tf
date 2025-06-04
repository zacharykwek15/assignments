
#Attach Policy to Role
resource "aws_iam_role_policy_attachment" "dynamodb_policy_attach" {
    role = aws_iam_role.dynamodb_read_role.name
    policy_arn = aws_iam_policy.dynamodb_read_policy.arn
}

#IAM Instance profile 

resource "aws_iam_instance_profile" "dynamodb_read_policy" {
    name = "zh-dyamodb_read"
    role = aws_iam_role.dynamodb_read_role.name
}

#Creating of EC2 instance with IAM role
resource "aws_instance" "public" {
    ami                         = "ami-04c913012f8977029"
    instance_type               = "t2.micro"
    subnet_id                   = "subnet-0732248c94175c7ea"  #Public Subnet ID, e.g. subnet-xxxxxxxxxxx
    associate_public_ip_address = true
    iam_instance_profile        = aws_iam_instance_profile.dynamodb_read_policy.name
    key_name                    = "zh-key" #Change to your keyname, e.g. jazeel-key-pair
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]
 
    tags = {
        Name = "zh-ec2"
    }
}
resource "aws_security_group" "allow_ssh" {
  name        = "zh-tf-asg" #Security group name, e.g. jazeel-terraform-security-group
  description = "Allow SSH inbound"
  vpc_id      =  "vpc-0f00a5f883f248f68"   #VPC ID (Same VPC as your EC2 subnet above), E.g. vpc-xxxxxxx
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_ssh.id
  cidr_ipv4         = "0.0.0.0/0"  
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}