resource "aws_instance" "public" {
  ami                         = "ami-0e8ebb0ab254bb563" # find the AMI ID of Amazon Linux 2023  
  instance_type               = "t2.micro"
  subnet_id                   = module.vpc.public_subnets[0]  #Public Subnet ID, e.g. subnet-xxxxxxxxxxx
  associate_public_ip_address = true
  #key_name                    = "zh-keypair" #Change to your keyname, e.g. jazeel-key-pair 
  #Blackout Key_name as i dont 
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
 
  tags = {
    Name = "zh-ec2"    #Prefix your own name
  }
}

resource "aws_security_group" "allow_ssh" {
  name        = "zh-terraform-security-group" #Security group name, e.g. jazeel-terraform-security-group
  description = "Allow SSH inbound"
  vpc_id      = module.vpc.vpc_id  #VPC ID (Same VPC as your EC2 subnet above), E.g. vpc-xxxxxxx
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_ssh.id
  cidr_ipv4         = "0.0.0.0/0"  
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

#Creation of S3 bucket 
resource "aws_s3_bucket" "bucket-2" {
  bucket = "zh-s3-bucket-1"
  force_destroy = true
}



#Creating my own VPC (Otherwise aws_security_group need to manually change when VPC not available)
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name = "zh-vpc"
  cidr = "10.0.0.0/16"
  azs = ["ap-southeast-1a", "ap-southeast-1b","ap-southeast-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets = ["10.0.101.0/24","10.0.102.0/24","10.0.103.0/24" ]

  enable_nat_gateway = false

  tags = {
    Terraform = "true"
    environment = "dev"
    owner = "zh"
  }

  }