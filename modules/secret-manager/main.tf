resource "google_secret_manager_secret" "jwt-access-secret" {
  secret_id = "jwt-access-secret"

  replication {
    auto {

    }

  }
}

resource "google_secret_manager_secret_version" "jwt-access-secret" {
  secret      = google_secret_manager_secret.jwt-access-secret.id
  secret_data = var.jwt-access-secret
}

resource "google_service_account_iam_binding" "jwt-access-secret" {
  service_account_id = var.serena-backend-sa-email
  role               = "roles/secretmanager.secretAccessor"

  members = [
    "serviceAccount:${var.serena-backend-sa-email}",
  ]
}
