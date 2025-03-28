resource "aws_db_subnet_group" "rjhxa_gsg_rds_subnet_group" {
  name       = "rjhxa-gsg-rds-subnet-group"
  subnet_ids = [var.private_1_subnet_id, var.private_2_subnet_id]

  tags = {
    Name    = "rjhxa_gsg RDS Subnet Group"
    project = "rjhxa_gsg"
  }
}

resource "aws_db_instance" "rjhxa_gsg_rds" {
  identifier             = "mysql-instance"
  allocated_storage      = 20
  storage_type           = "gp2"
  engine                = "mysql"
  engine_version        = "8.0"
  instance_class        = "db.t3.micro"
  db_name               = "mydatabase"
  username             = "admin"
  password             = "password"
  publicly_accessible   = false
  vpc_security_group_ids = [var.sg_rds_id]
  db_subnet_group_name   = aws_db_subnet_group.rjhxa_gsg_rds_subnet_group.name
  backup_retention_period = 7
  skip_final_snapshot   = true

  tags = {
    Name    = "mysql-instance"
    project = "rjhxa_gsg"
  }
}

output "rds_endpoint" {
    value = aws_db_instance.rjhxa_gsg_rds.endpoint
}