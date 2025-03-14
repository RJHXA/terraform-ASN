module "vpc" {
    source = "./modules/vpc"
}

module "security_group" {
    source = "./modules/security_group"
    vpc_id = module.vpc.vpc_id
}

module "ec2" {
    source             = "./modules/ec2"
    public_subnet_id   = module.vpc.public_subnet_id
    security_group_ec2 = module.security_group.security_group_ec2_id
}

module "rds" {
    source             = "./modules/rds"
    security_group_rds = module.security_group.security_group_rds_id
}