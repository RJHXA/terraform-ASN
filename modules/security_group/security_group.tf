resource "aws_security_group" "rjhxa_gsg_sg_ec2" {
    vpc_id = module.vpc.vpc_id
    name = "Allow HTTP"

    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name   = "rjhxa_gsg_sg_ec2"
        Aluno  = "rjhxa_gsg"
        Periodo = "8"
    }
}

resource "aws_security_group" "rjhxa_gsg_sg_rds" {
    vpc_id = module.vpc.vpc_id
    name = "Allow 3306"

    ingress {
        from_port       = 3306
        to_port         = 3306
        protocol        = "tcp"
        security_groups = [aws_security_group.rjhxa_gsg_sg_ec2.id]
    }

    tags = {
        Name   = "rjhxa_gsg_sg_rds"
        Aluno  = "rjhxa_gsg"
        Periodo = "8"
    }
}

output "sg_name_web" {
    value = aws_security_group.rjhxa_gsg_sg_ec2.name
}

output "sg_name_rds" {
    value = aws_security_group.rjhxa_gsg_sg_rds.name
}