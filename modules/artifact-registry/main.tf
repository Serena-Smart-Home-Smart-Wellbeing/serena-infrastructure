resource "google_artifact_registry_repository" "cloud-run-source-deploy" {
  location      = var.location
  repository_id = "cloud-run-source-deploy"
  description   = "Cloud Run Source Deployments"
  format        = "DOCKER"
  mode          = "STANDARD_REPOSITORY"
}

resource "google_artifact_registry_repository_iam_binding" "cloud-run-source-deploy-admins" {
  location   = google_artifact_registry_repository.cloud-run-source-deploy.location
  repository = google_artifact_registry_repository.cloud-run-source-deploy.name
  role       = "roles/artifactregistry.admin"

  members = var.cloud-run-source-deploy-admins
}
