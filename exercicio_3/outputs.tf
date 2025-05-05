output "eks_cluster_name" {
  value = module.data_sources.eks_cluster_name
}

output "node_group_name" {
  description = "Nome do Node Group criado"
  value       = module.node_group.node_group_name
}

output "node_group_arn" {
  description = "ARN do Node Group"
  value       = module.node_group.node_group_arn
}