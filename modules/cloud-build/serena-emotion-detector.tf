resource "google_cloudbuild_trigger" "serena-emotion-detector-github-trigger" {
  name        = "serena-emotion-detector-github-trigger"
  location    = var.location
  description = "Build and deploy to Cloud Run service serena-emotion-detector on push to \"^main$\""

  github {
    owner = "Serena-Smart-Home-Smart-Wellbeing"
    name  = "serena-emotion-detector"
    push {
      branch = "^main$"
    }
  }
  include_build_logs = "INCLUDE_BUILD_LOGS_WITH_STATUS"

  service_account = var.serena-cloud-build-sa-id

  filename = "/deploy/cloudbuild.yaml"
}
