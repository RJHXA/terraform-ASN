resource "aws_db_instance" "rds" {
    allocated_storage    = 20
    db_name              = "mydb"
    engine              = "mysql"
    instance_class       = "db.t2.micro"
    username            = "admin"
    password            = "terraformpass"
    vpc_security_group_ids = [var.ec2_sg_id]
    db_subnet_group_name = aws_db_subnet_group.main.id
    publicly_accessible  = false

    tags = {
        Name  = "RDS-MySQL"
        Owner = "Rafael_Gabriel"
    }
}