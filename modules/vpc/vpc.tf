resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name  = "Main-VPC"
        Owner = "Rafael_Gabriel"
    }
}

resource "aws_subnet" "public" {
    vpc_id                  = aws_vpc.main.id
    cidr_block              = "10.0.1.0/24"
    map_public_ip_on_launch = true
    tags = {
        Name  = "Public-Subnet"
        Owner = "Rafael_Gabriel"
    }
}

resource "aws_subnet" "private" {
    vpc_id     = aws_vpc.main.id
    cidr_block = "10.0.2.0/24"
    tags = {
        Name  = "Private-Subnet"
        Owner = "Rafael_Gabriel"
    }
}