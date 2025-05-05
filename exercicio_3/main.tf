module "node_group" {
  source            = "./modules/node_group"
  eks_cluster_name  = module.data_sources.eks_cluster_name
  node_group_name   = "nodeGroupRjhxaGsg"
  subnet_ids        = module.data_sources.subnet_ids
  node_role_arn     = var.node_role_arn
  ec2_ssh_key       = var.ec2_ssh_key
}

module "data_sources" {
  source            = "./data_sources"
  eks_cluster_name  = var.eks_cluster_name
}

module "app" {
  source = "./modules/app"
}
