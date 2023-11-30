resource "google_storage_bucket" "serena-app-storage" {
  name                        = "serena-app-storage"
  location                    = var.GCP_REGION
  force_destroy               = true
  public_access_prevention    = "inherited"
  uniform_bucket_level_access = true
}

resource "google_storage_bucket_iam_binding" "serena-app-storage-admins" {
  bucket = google_storage_bucket.serena-app-storage.name
  role   = "roles/storage.admin"

  members = [
    "user:mreyhanapwsw@gmail.com",
    "user:c200bsy3485@bangkit.academy",
  ]
}

resource "google_storage_bucket_iam_binding" "serena-app-storage-object-admins" {
  bucket = google_storage_bucket.serena-app-storage.name
  role   = "roles/storage.objectAdmin"

  members = [
    "group:tim-serena-shsw@googlegroups.com",
    "serviceAccount:${var.serena-notebook-sa-email}",
    "serviceAccount:${var.serena-backend-sa-email}"
  ]
}

resource "google_storage_bucket_iam_binding" "serena-app-storage-object-viewers" {
  bucket = google_storage_bucket.serena-app-storage.name
  role   = "roles/storage.objectViewer"

  members = [
    "allUsers"
  ]
}


