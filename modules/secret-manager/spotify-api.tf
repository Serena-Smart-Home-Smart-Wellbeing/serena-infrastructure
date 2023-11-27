resource "google_secret_manager_secret" "spotify-client-id" {
  secret_id = "spotify-client-id"

  replication {
    auto {

    }
  }
}

resource "google_secret_manager_secret_version" "spotify-client-id" {
  secret      = google_secret_manager_secret.spotify-client-id.id
  secret_data = var.spotify-client-id
}

resource "google_secret_manager_secret_iam_binding" "spotify-client-id-accessors" {
  secret_id = google_secret_manager_secret.spotify-client-id.id
  role      = "roles/secretmanager.secretAccessor"

  members = var.spotify-api-accessors
}

resource "google_secret_manager_secret" "spotify-client-secret" {
  secret_id = "spotify-client-secret"

  replication {
    auto {

    }
  }
}

resource "google_secret_manager_secret_version" "spotify-client-secret" {
  secret      = google_secret_manager_secret.spotify-client-secret.id
  secret_data = var.spotify-client-secret
}

resource "google_secret_manager_secret_iam_binding" "spotify-client-secret-accessors" {
  secret_id = google_secret_manager_secret.spotify-client-secret.id
  role      = "roles/secretmanager.secretAccessor"

  members = var.spotify-api-accessors
}
