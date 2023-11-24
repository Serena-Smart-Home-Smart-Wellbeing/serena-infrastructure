resource "google_cloudbuild_trigger" "serena-backend-github-trigger" {
  name        = "serena-backend-github-trigger"
  location    = "global"
  description = "Build and deploy to Cloud Run service serena-backend on push to \"^main$\""

  # https= github.com/Serena-Smart-Home-Smart-Wellbeing/serena-infrastructure
  github {
    owner = "Serena-Smart-Home-Smart-Wellbeing"
    name  = "serena-backend"
    push {
      branch = "^main$"
    }
  }
  include_build_logs = "INCLUDE_BUILD_LOGS_WITH_STATUS"

  service_account = var.serena-cloud-build-sa-email

  filename = "cloudbuild.yaml"
  tags = [
    "gcp-cloud-build-deploy-cloud-run",
    "gcp-cloud-build-deploy-cloud-run-managed",
    "serena-backend",
  ]
  substitutions = {
    _AR_HOSTNAME   = "asia-southeast2-docker.pkg.dev"
    _DEPLOY_REGION = "asia-southeast2"
    _ENTRYPOINT    = "npm run start"
    _PLATFORM      = "managed"
    _SERVICE_NAME  = "serena-backend"
    _TRIGGER_ID    = "d980f73f-fa5c-4dbd-8af6-ee9e67854f79"
  }
}
