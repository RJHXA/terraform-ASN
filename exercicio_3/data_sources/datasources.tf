data "aws_eks_cluster" "this" {
  name = var.eks_cluster_name
}

data "aws_eks_cluster_auth" "this" {
  name = var.eks_cluster_name
}

data "aws_vpc" "eks_vpc" {
  id = data.aws_eks_cluster.this.vpc_config[0].vpc_id
}

data "aws_subnets" "eks_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.eks_vpc.id]
  }
}

locals {
  eks_security_group_ids = data.aws_eks_cluster.this.vpc_config[0].security_group_ids
}

data "aws_security_group" "eks_sg" {
  count = length(local.eks_security_group_ids) > 0 ? 1 : 0
  id    = local.eks_security_group_ids[0]
}