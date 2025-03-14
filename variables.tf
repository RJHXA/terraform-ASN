variable "region" {
    description = "Região AWS"
    default     = "us-west-2"
}

variable "vpc_cidr" {
    description = "Bloco CIDR da VPC"
    default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
    description = "Bloco CIDR da Subnet Pública"
    default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
    description = "Bloco CIDR da Subnet Privada"
    default     = "10.0.2.0/24"
}

variable "instance_type" {
    description = "Tipo da instância EC2"
    default     = "t2.micro"
}