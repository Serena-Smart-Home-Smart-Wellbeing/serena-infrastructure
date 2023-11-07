resource "google_notebooks_instance" "emotion-detector-nb" {
  name            = "emotion-detector-nb"
  location        = "asia-southeast2-a"
  machine_type    = "n1-standard-4"
  service_account = var.emotion-detector-nb-sa-email

  # Disk
  boot_disk_type    = "PD_STANDARD"
  boot_disk_size_gb = 50
  data_disk_type    = "PD_STANDARD"
  data_disk_size_gb = 50
  vm_image {
    project      = "deeplearning-platform-release"
    image_family = "tf-latest-cpu"
  }


  # Networking
  no_public_ip = false
  network      = var.network
  subnet       = var.subnet
}

resource "google_notebooks_instance_iam_binding" "emotion-detector-nb-admins" {
  instance_name = google_notebooks_instance.emotion-detector-nb.name
  role          = "roles/notebooks.admin"

  members = [
    "serviceAccount:${var.emotion-detector-nb-sa-email}"
  ]
}
