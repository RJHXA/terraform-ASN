variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-central-1"  
}

variable "eks_cluster_name" {
  description = "Nome do cluster EKS existente"
  type        = string
}

variable "node_role_arn" {
  description = "ARN da IAM Role associada ao Node Group"
  type        = string
}

variable "ec2_ssh_key" {
  description = "Nome da chave SSH para acesso às instâncias EC2"
  type        = string
}