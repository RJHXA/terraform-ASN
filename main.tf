provider "aws" {
    region = "us-west-2"
}

module "vpc" {
    source = "./modules/vpc"
}

module "ec2" {
    source       = "./modules/ec2"
    vpc_id       = module.vpc.vpc_id
    subnet_id    = module.vpc.public_subnet_id
}

module "rds" {
    source       = "./modules/rds"
    vpc_id       = module.vpc.vpc_id
    subnet_id    = module.vpc.private_subnet_id
    ec2_sg_id    = module.ec2.security_group_id
}
