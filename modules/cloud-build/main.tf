resource "google_cloudbuild_trigger" "serena-backend-github-trigger" {
  name        = "serena-backend-github-trigger"
  location    = "global"
  description = "Build and deploy to Cloud Run service serena-backend on push to ^main$"

  # https://github.com/Serena-Smart-Home-Smart-Wellbeing/serena-infrastructure
  github {
    owner = "Serena-Smart-Home-Smart-Wellbeing"
    name  = "serena-backend"
    push {
      branch = "^main$"
    }
    enterprise_config_resource_name = "projects/123456789/locations/us-central1/githubEnterpriseConfigs/configID"
  }
  include_build_logs = "INCLUDE_BUILD_LOGS_WITH_STATUS"

  service_account = var.serena-cloud-build-sa-email

  filename = "cloudbuild.yaml"
  tags = [
    "gcp-cloud-build-deploy-cloud-run",
    "gcp-cloud-build-deploy-cloud-run-managed",
    "serena-backend",
  ]
}
