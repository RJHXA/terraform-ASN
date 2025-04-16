variable "vpc_cidr" {
  description = "Bloco CIDR da VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "Bloco CIDR para Subnet Public"
  type        = string
}

variable "private_1_subnet_cidr" {
  description = "Bloco CIDR para Subnet Privada 1"
  type        = string
}

variable "private_2_subnet_cidr" {
  description = "Bloco CIDR para Subnet Privada 2"
  type        = string
}
