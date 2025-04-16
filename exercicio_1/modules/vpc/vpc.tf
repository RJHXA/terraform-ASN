resource "aws_vpc" "rjhxa_gsg_vpc" {
    cidr_block = var.vpc_cidr

    tags = {
        Name   = "rjhxa_gsg_vpc"
        Aluno  = "rjhxa_gsg"
        Periodo = "8"
    }
}

resource "aws_subnet" "rjhxa_gsg_public" {
    vpc_id                  = aws_vpc.rjhxa_gsg_vpc.id
    cidr_block              = var.public_subnet_cidr
    map_public_ip_on_launch = true
    availability_zone = "us-west-2a"

    tags = {
        Name   = "rjhxa_gsg_public_subnet"
        Aluno  = "rjhxa_gsg"
        Periodo = "8"
    }
}

resource "aws_subnet" "rjhxa_gsg_private_1" {
    vpc_id     = aws_vpc.rjhxa_gsg_vpc.id
    cidr_block = var.private_1_subnet_cidr
    availability_zone = "us-west-2b"

    tags = {
        Name   = "rjhxa_gsg_private_subnet"
        Aluno  = "rjhxa_gsg"
        Periodo = "8"
    }
}

resource "aws_subnet" "rjhxa_gsg_private_2" {
    vpc_id     = aws_vpc.rjhxa_gsg_vpc.id
    cidr_block = var.private_2_subnet_cidr
    availability_zone       = "us-west-2c"

    tags = {
        Name   = "rjhxa_gsg_private_subnet"
        Aluno  = "rjhxa_gsg"
        Periodo = "8"
    }
}
