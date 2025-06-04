
#Creating Two VPC 
module "vpc" {
    source = "terraform-aws-modules/vpc/aws"
    name = "zh-vpc"
    cidr = "10.1.0.0/16"
    azs             = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
    private_subnets = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]
    public_subnets  = ["10.1.101.0/24", "10.1.102.0/24", "10.1.103.0/24"]

    enable_nat_gateway   = false

    tags = {
        Terraform = "true"
        environment ="dev"
        owner = "zh"
 }
}

module "vpc" {
    source = "terraform-aws-modules/vpc/aws"
    name = "zh-vpc-2"
    cidr = "10.2.0.0/16"
    azs             = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
    private_subnets = ["10.2.1.0/24", "10.2.2.0/24", "10.2.3.0/24"]
    public_subnets  = ["10.2.101.0/24", "10.2.102.0/24", "10.2.103.0/24"]

    enable_nat_gateway   = false

    tags = {
        Terraform = "true"
        environment ="dev"
        owner = "zh"
 }
}
