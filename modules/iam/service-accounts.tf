resource "google_service_account" "serena-backend" {
  account_id   = "serena-backend"
  display_name = "serena-backend"
  description  = "SA for Serena Backends"
}

resource "google_service_account_iam_binding" "serena-backend-admins" {
  service_account_id = google_service_account.serena-backend.name
  role               = "roles/iam.serviceAccountAdmin"

  members = [
    "user:c200bsy3485@bangkit.academy",
    "user:mreyhanapwsw@gmail.com"
  ]
}

resource "google_service_account_iam_binding" "serena-backend-users" {
  service_account_id = google_service_account.serena-backend.name
  role               = "roles/iam.serviceAccountUser"

  members = [
    "user:c200bsy3485@bangkit.academy",
    "user:mreyhanapwsw@gmail.com"
  ]
}

resource "google_service_account" "serena-cloud-build" {
  account_id   = "serena-cloud-build"
  display_name = "serena-cloud-build"
  description  = "SA for Cloud Build"
}

resource "google_service_account_iam_binding" "serena-cloud-build-admins" {
  service_account_id = google_service_account.serena-cloud-build.name
  role               = "roles/iam.serviceAccountAdmin"

  members = [
    "user:c200bsy3485@bangkit.academy",
    "user:mreyhanapwsw@gmail.com"
  ]
}

resource "google_service_account_iam_binding" "serena-cloud-build-users" {
  service_account_id = google_service_account.serena-cloud-build.name
  role               = "roles/iam.serviceAccountUser"

  members = [
    "user:c200bsy3485@bangkit.academy",
    "user:mreyhanapwsw@gmail.com"
  ]
}

