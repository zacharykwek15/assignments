

#create a 1GB EBS volume in the same AZ as EC2 instance
resource "aws_ebs_volume" "extra_volume" {
    availability_zone = aws_instance.zh_ec2.availability_zone #Pull AZ directly from EC2 created below
    size = var.volume_size
    tags = {
        Name = "extra-volume"
    }
}

#Attach the EBS volume to the EC2 instance
resource "aws_volume_attachment" "ebs_attach" {
    device_name = "/dev/sdf" 
    volume_id = aws_ebs_volume.extra_volume.id
    instance_id = aws_instance.zh_ec2.id #Since we are creating EC2, we just link directly
}

#Launching an EC2 instance
resource "aws_instance" "zh_ec2" {
    ami = "ami-0afc7fe9be84307e4" #Go to launch instance in EC2 and look under 64-bit
    instance_type = "t2.micro"

    tags = {
        Name = "zh-ec2-instance"
    } 
}   

