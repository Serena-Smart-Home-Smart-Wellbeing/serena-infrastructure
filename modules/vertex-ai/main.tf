resource "google_notebooks_runtime" "emotion-detector-nb" {
  name     = "emotion-detector-nb"
  location = "asia-southeast1"

  access_config {
    access_type   = "SERVICE_ACCOUNT"
    runtime_owner = var.emotion-detector-nb-sa-email
  }

  virtual_machine {
    virtual_machine_config {
      machine_type = "n1-standard-8"

      data_disk {
        initialize_params {
          disk_size_gb = "100"
          disk_type    = "PD_STANDARD"
        }
      }

      #   network = var.network
    }

  }

  software_config {
    idle_shutdown         = true
    idle_shutdown_timeout = 30
  }

}

resource "google_notebooks_runtime_iam_binding" "emotion-detector-nb-admins" {
  runtime_name = google_notebooks_runtime.emotion-detector-nb.name
  role         = "roles/notebooks.admin"

  members = [
    "serviceAccount:${var.emotion-detector-nb-sa-email}"
  ]
}
