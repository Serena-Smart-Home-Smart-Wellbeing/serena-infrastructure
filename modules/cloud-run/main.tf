resource "google_cloud_run_service" "serena-backend" {
  name     = "serena-backend"
  location = var.location

  template {
    metadata {
      annotations = {
        "autoscaling.knative.dev/maxScale" = "1",
        "autoscaling.knative.dev/minScale" = "0",
      }
    }
    spec {
      containers {
        image = var.serena-backend-image

        resources {
          limits = {
            cpu    = "1000m"
            memory = "512Mi"
          }
        }

        ports {
          container_port = 8080
        }
      }
      service_account_name = var.serena-backend-sa-email
    }
  }


  traffic {
    percent         = 100
    latest_revision = true
  }
}

resource "google_cloud_run_service_iam_binding" "serena-backend-invoker" {
  location = var.location
  service  = google_cloud_run_service.serena-backend.name
  role     = "roles/run.invoker"

  members = [
    "allUsers"
  ]
}
