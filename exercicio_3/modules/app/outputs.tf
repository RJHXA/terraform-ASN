output "todo_service_name" {
  value = kubernetes_service.todo_service.metadata[0].name
}

output "todo_service_ip" {
  value = kubernetes_service.todo_service.status[0].load_balancer[0].ingress[0].hostname
}