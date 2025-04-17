output "sg_public_id" {
    value = aws_security_group.ec2_public_sg.id
}

output "sg_private_id" {
    value = aws_security_group.ec2_private_sg.id
}

output "sg_rds_id" {
    value = aws_security_group.rds_sg.id
}

output "sg_alb_id" {
    value = aws_security_group.alb_sg.id
}
