resource "aws_instance" "web_server" {
    ami           = "ami-12345678" # Substituir pelo ID da AMI desejada
    instance_type = "t2.micro"
    subnet_id     = var.subnet_id
    security_groups = [aws_security_group.ec2_sg.id]

    user_data = <<-EOF
                #!/bin/bash
                sudo apt update -y
                sudo apt install apache2 -y
                sudo systemctl start apache2
                sudo systemctl enable apache2
                EOF

    tags = {
        Name  = "Web-Server"
        Owner = "Rafael_Gabriel"
    }
}

resource "aws_security_group" "ec2_sg" {
    vpc_id = var.vpc_id

    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name  = "EC2-SG"
        Owner = "Rafael_Gabriel"
    }
}