variable "region" {
    description = "Região AWS"
    default     = "us-west-2"
}

variable "vpc_cidr" {
    description = "Bloco CIDR da VPC"
    default     = "172.31.0.0/16"
}

variable "public_subnet_cidr" {
    description = "Bloco CIDR da Subnet Publica"
    default     = "172.31.1.0/24"
}

variable "private_1_subnet_cidr" {
    description = "Bloco CIDR da Subnet Privada"
    default     = "172.31.2.0/24"
}

variable "private_2_subnet_cidr" {
    description = "Bloco CIDR da Subnet Privada"
    default     = "172.31.3.0/24"
}

variable "instance_type" {
    description = "Tipo da instância EC2"
    default     = "t2.micro"
}

variable "ami_id" {
    description = "ID da imagem da instância"
    default     = "ami-0b6d6dacf350ebc82"
}