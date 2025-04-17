output "vpc_id" {
    value = aws_vpc.rjhxa_gsg_vpc.id
}

output "public_1_subnet_id" {
    value = aws_subnet.rjhxa_gsg_public_1.id
}

output "public_2_subnet_id" {
    value = aws_subnet.rjhxa_gsg_public_2.id
}

output "private_1_subnet_id" {
    value = aws_subnet.rjhxa_gsg_private_1.id
}

output "private_2_subnet_id" {
    value = aws_subnet.rjhxa_gsg_private_2.id
}
