/* Insert project level iams & service accounts (SA) in this folder, 
for each resource binding put them in their respective folders */

resource "google_project_iam_binding" "project-owners" {
  project = var.GCP_PROJECT_ID
  role    = "roles/owner"

  members = [
    "user:mreyhanapwsw@gmail.com",
    "user:c200bsy3485@bangkit.academy",
    "serviceAccount:${google_service_account.serena-tf.email}",
  ]
}

resource "google_project_iam_binding" "project-editors" {
  project = var.GCP_PROJECT_ID
  role    = "roles/editor"

  members = [
    "group:tim-serena-shsw@googlegroups.com",
  ]
}

resource "google_project_iam_binding" "bucket-admins" {
  project = var.GCP_PROJECT_ID
  role    = "roles/storage.admin"

  members = [
    "serviceAccount:${google_service_account.serena-notebook.email}",
  ]
}

resource "google_service_account" "serena-tf" {
  account_id   = "serena-tf"
  display_name = "serena-tf"
  description  = "SA for Terraform use"
}

resource "google_service_account_iam_binding" "serena-tf-admins" {
  service_account_id = google_service_account.serena-tf.name
  role               = "roles/iam.serviceAccountAdmin"

  members = [
    "user:c200bsy3485@bangkit.academy",
    "user:mreyhanapwsw@gmail.com"
  ]
}

resource "google_service_account_iam_binding" "serena-tf-users" {
  service_account_id = google_service_account.serena-tf.name
  role               = "roles/iam.serviceAccountUser"

  members = [
    "user:c200bsy3485@bangkit.academy",
    "user:mreyhanapwsw@gmail.com"
  ]
}

resource "google_service_account" "serena-notebook" {
  account_id   = "serena-notebook"
  display_name = "serena-notebook"
  description  = "SA for Vertex AI Notebooks"
}

resource "google_service_account_iam_binding" "serena-notebook-admins" {
  service_account_id = google_service_account.serena-notebook.name
  role               = "roles/iam.serviceAccountAdmin"

  members = [
    "user:c200bsy3485@bangkit.academy",
    "user:mreyhanapwsw@gmail.com"
  ]
}

resource "google_service_account_iam_binding" "serena-notebook-users" {
  service_account_id = google_service_account.serena-notebook.name
  role               = "roles/iam.serviceAccountUser"

  members = [
    "user:c200bsy3485@bangkit.academy",
    "user:mreyhanapwsw@gmail.com"
  ]
}
