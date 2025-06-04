output "ebs_volume_id" {
    value = aws_ebs_volume.extra_volume.id
}

output "attached_instance_id" {
    value = aws_instance.zh_ec2.id
}