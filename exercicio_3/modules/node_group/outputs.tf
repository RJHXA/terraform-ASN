output "node_group_name" {
  description = "Nome do Node Group criado"
  value       = aws_eks_node_group.this.node_group_name
}

output "node_group_arn" {
  description = "ARN do Node Group criado"
  value       = aws_eks_node_group.this.arn
}