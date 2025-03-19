resource "aws_instance" "rjhxa_gsg_ec2" {
    ami           = "ami-0b6d6dacf350ebc82"
    instance_type = var.instance_type
    subnet_id     = module.vpc.public_subnet_id
    security_groups = [module.security_group.sg_name_web]

    user_data = <<-EOF
                #!/bin/bash
                sudo yum update -y
                sudo yum install -y httpd
                sudo systemctl start httpd
                sudo systemctl enable httpd
                EOF

    tags = {
        Name   = "rjhxa_gsg_ec2"
        Aluno  = "rjhxa_gsg"
        Periodo = "8"
    }
}

output "public_ip" {
    value = aws_instance.web_server.public_ip
}