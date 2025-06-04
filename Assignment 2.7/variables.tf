variable "aws_region" {
    default = "ap-southeast-1"
}


variable "volume_size" {
    description = "Size of the EBS volume in GB"
    type = number
    default = 1
  
}