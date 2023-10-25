resource "google_storage_bucket" "serena-shsw-datasets" {
  name                        = "serena-shsw-datasets"
  location                    = var.GCP_REGION
  force_destroy               = true
  public_access_prevention    = "enforced"
  uniform_bucket_level_access = true
}

resource "google_storage_bucket_iam_binding" "serena-shsw-datasets-admins" {
  bucket = google_storage_bucket.serena-shsw-datasets.name
  role   = "roles/storage.admin"

  members = [
    "user:mreyhanapwsw@gmail.com",
    "user:c200bsy3485@bangkit.academy",
  ]
}

resource "google_storage_bucket_iam_binding" "serena-shsw-datasets-object-admins" {
  bucket = google_storage_bucket.serena-shsw-datasets.name
  role   = "roles/storage.objectAdmin"

  members = [
    "group:tim-serena-shsw@googlegroups.com",
    "serviceAccount:image-uploader@serena-777.iam.gserviceaccount.com",
  ]
}
