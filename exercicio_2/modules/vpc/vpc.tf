resource "aws_vpc" "rjhxa_gsg_vpc" {
    cidr_block = var.vpc_cidr

    tags = {
        Name   = "rjhxa_gsg_vpc"
        Aluno  = "rjhxa_gsg"
        Periodo = "8"
    }
}

resource "aws_subnet" "rjhxa_gsg_public_1" {
    vpc_id                  = aws_vpc.rjhxa_gsg_vpc.id
    cidr_block              = var.public_1_subnet_cidr
    map_public_ip_on_launch = true
    availability_zone = "us-west-2a"

    tags = {
        Name   = "rjhxa_gsg_public_subnet"
        Aluno  = "rjhxa_gsg"
        Periodo = "8"
    }
}

resource "aws_subnet" "rjhxa_gsg_public_2" {
    vpc_id                  = aws_vpc.rjhxa_gsg_vpc.id
    cidr_block              = var.public_2_subnet_cidr
    map_public_ip_on_launch = true
    availability_zone = "us-west-2b"

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

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.rjhxa_gsg_vpc.id

  tags = {
    Name    = "Main-Internet-Gateway"
    project = "rjhxa_gsg"
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.rjhxa_gsg_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name    = "Public-Route-Table"
    project = "rjhxa_gsg"
  }
}

resource "aws_route_table_association" "public_subnet_1" {
  subnet_id      = aws_subnet.rjhxa_gsg_public_1.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public_subnet_2" {
  subnet_id      = aws_subnet.rjhxa_gsg_public_2.id
  route_table_id = aws_route_table.public_route_table.id
}