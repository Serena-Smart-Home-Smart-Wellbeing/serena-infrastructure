resource "google_project_iam_binding" "project-viewers" {
  project = var.GCP_PROJECT_ID
  role    = "roles/viewer"

  members = [
    "user:zuberkhatib@bangkit.academy"
  ]
}
