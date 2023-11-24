resource "google_artifact_registry_repository" "my-repo" {
  location      = var.location
  repository_id = "cloud-run-source-deploy"
  description   = "Cloud Run Source Deployments"
  format        = "DOCKER"
  mode          = "STANDARD_REPOSITORY"
}
