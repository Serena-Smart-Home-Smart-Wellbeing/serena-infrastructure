resource "google_secret_manager_secret" "serena-main-sql-connection" {
  secret_id = "serena-main-sql-connection"

  replication {
    auto {

    }

  }
}

resource "google_secret_manager_secret_version" "serena-main-sql-connection" {
  secret      = google_secret_manager_secret.serena-main-sql-connection.id
  secret_data = var.serena-main-sql-connection
}

resource "google_secret_manager_secret_iam_binding" "serena-main-sql-connection-accessors" {
  secret_id = google_secret_manager_secret.serena-main-sql-connection.id
  role      = "roles/secretmanager.secretAccessor"

  members = [
    "serviceAccount:${var.serena-backend-sa-email}",
  ]
}
