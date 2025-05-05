resource "kubernetes_deployment" "todo_list" {
  metadata {
    name = "todo-list"
    labels = {
      app = "todo-list"
    }
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "todo-list"
      }
    }
    template {
      metadata {
        labels = {
          app = "todo-list"
        }
      }
      spec {
        container {
          name  = "todo-list"
          image = "rjhxa/getting-started@sha256:f68fd17d036486d8ffdd3ac5cd188aa591ca19a40031c4cd5ced02c0a684f167"
          port {
            container_port = 3000
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "todo_service" {
  metadata {
    name = "todo-service"
  }

  spec {
    selector = {
      app = "todo-list"
    }

    port {
      port        = 80
      target_port = 3000
    }

    type = "LoadBalancer"
  }
}