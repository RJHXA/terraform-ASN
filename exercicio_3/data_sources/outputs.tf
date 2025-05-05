output "eks_cluster_name" {
  value = data.aws_eks_cluster.this.name
}

output "subnet_ids" {
  value = data.aws_subnets.eks_subnets.ids
}