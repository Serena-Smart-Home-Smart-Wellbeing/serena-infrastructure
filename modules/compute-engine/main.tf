resource "google_service_account" "image-uploader" {
  account_id   = "image-uploader"
  display_name = "image-uploader"
  description  = "SA for image uploader"
}

resource "google_service_account_iam_binding" "image-uploader-admins" {
  service_account_id = google_service_account.image-uploader.name
  role               = "roles/iam.serviceAccountAdmin"

  members = [
    "user:c200bsy3485@bangkit.academy",
    "user:mreyhanapwsw@gmail.com"
  ]
}

resource "google_storage_bucket_iam_binding" "serena-shsw-datasets-object-admins" {
  bucket = var.bucket_name
  role   = "roles/storage.objectAdmin"

  members = [
    "serviceAccount:${google_service_account.image-uploader.email}",
  ]
}

resource "google_compute_instance" "image-uploader" {
  name         = "image-uploader"
  machine_type = "e2-standard-2"

  boot_disk {
    initialize_params {
      size = 5
      type = "pd-standard"
    }
  }

  network_interface {
    subnetwork = var.subnetwork
  }

  allow_stopping_for_update = true

  service_account {
    scopes = ["cloud-platform"]
    email  = google_service_account.image-uploader.email
  }
}
