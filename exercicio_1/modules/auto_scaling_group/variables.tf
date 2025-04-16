variable "ami_id" {
  description = "ID da AMI para a EC2"
  type        = string
}

variable "ec2_public_sg_id" {
  description = "ID do Security Group da EC2 pública"
  type        = string
}

variable "vpc_id" {
  description = "ID da VPC"
  type        = string
}

variable "public_subnet_id" {
  description = "ID Subnet Public"
  type        = string
}

variable "private_1_subnet_id" {
  description = "ID Subnet Privada 1"
  type        = string
}

variable "private_2_subnet_id" {
  description = "ID Subnet Privada 2"
  type        = string
}