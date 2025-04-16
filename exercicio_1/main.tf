module "vpc" {
    source = "./modules/vpc"
    vpc_cidr = var.vpc_cidr
    public_subnet_cidr = var.public_subnet_cidr
    private_1_subnet_cidr = var.private_1_subnet_cidr
    private_2_subnet_cidr = var.private_2_subnet_cidr
}

module "security_group" {
    source = "./modules/security_group"
    vpc_id = module.vpc.vpc_id
}

module "auto_scaling_group" {
    source = "./modules/auto_scaling_group"
    vpc_id = module.vpc.vpc_id
    ami_id = var.ami_id
    ec2_public_sg_id = module.security_group.sg_public_id
    public_subnet_id = module.vpc.public_subnet_id
    private_1_subnet_id = module.vpc.private_1_subnet_id
    private_2_subnet_id = module.vpc.private_2_subnet_id
}

module "rds" {
    source             = "./modules/rds"
    sg_rds_id = module.security_group.sg_rds_id
    private_1_subnet_id = module.vpc.private_1_subnet_id
    private_2_subnet_id = module.vpc.private_2_subnet_id
}