import {
  id = "serena-shsw-dataset"
  to = google_storage_bucket.serena-shsw-dataset
}

resource "google_storage_bucket" "serena-shsw-dataset" {
  name                        = "serena-shsw-dataset"
  location                    = var.GCP_REGION
  force_destroy               = true
  public_access_prevention    = "enforced"
  uniform_bucket_level_access = true
}

resource "google_storage_bucket_iam_binding" "serena-shsw-dataset-admins" {
  bucket = google_storage_bucket.serena-shsw-dataset.name
  role   = "roles/storage.admin"

  members = [
    "user:mreyhanapwsw@gmail.com",
    "user:c200bsy3485@bangkit.academy",
  ]
}

resource "google_storage_bucket_iam_binding" "serena-shsw-dataset-object-admins" {
  bucket = google_storage_bucket.serena-shsw-dataset.name
  role   = "roles/storage.objectAdmin"

  members = [
    "group:tim-serena-shsw@googlegroups.com",

  ]
}
