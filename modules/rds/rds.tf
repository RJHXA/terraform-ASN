resource "aws_db_instance" "rjhxa_gsg_rds" {
    allocated_storage = 20
    engine            = "mysql"
    engine_version    = "8.0"
    instance_class    = "db.t2.micro"
    identifier        = "rjhxa-gsg-rds"
    username         = "admin"
    password         = "password123"
    publicly_accessible = false
    skip_final_snapshot = true
    vpc_security_group_ids = [var.security_group_rds]

    tags = {
        Name   = "rjhxa_gsg_rds"
        Aluno  = "rjhxa_gsg"
        Periodo = "8"
    }
}