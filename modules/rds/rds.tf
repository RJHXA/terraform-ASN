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
    vpc_security_group_ids = [module.security_group.rjhxa_gsg_sg_rds.id]

    tags = {
        Name   = "rjhxa_gsg_rds"
        Aluno  = "rjhxa_gsg"
        Periodo = "8"
    }
}

output "rds_endpoint" {
    value = aws_db_instance.rjhxa_gsg_rds.endpoint
}