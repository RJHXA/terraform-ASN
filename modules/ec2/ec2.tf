resource "aws_instance" "public_ec2" {
  ami           = "ami-0b6d6dacf350ebc82"
  instance_type = "t2.micro"
  subnet_id     = var.public_subnet_id
  vpc_security_group_ids = [var.ec2_public_sg_id]
  user_data     = file("${path.module}/user_data.sh")

  tags = {
    Name    = "Public-EC2"
    project = "rjhxa_gsg"
  }
}

resource "aws_instance" "private_ec2" {
  ami           = "ami-0b6d6dacf350ebc82"
  instance_type = "t2.micro"
  subnet_id     = var.private_subnet_id
  vpc_security_group_ids = [var.ec2_private_sg_id]
  user_data     = file("${path.module}/user_data.sh")

  tags = {
    Name    = "Private-EC2"
    project = "rjhxa_gsg"
  }
}
