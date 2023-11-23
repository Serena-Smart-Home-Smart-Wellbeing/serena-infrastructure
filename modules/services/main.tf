variable "services" {
  type = set(string)
  default = [
    "cloudresourcemanager.googleapis.com",
    "iam.googleapis.com",
    "compute.googleapis.com",
    "aiplatform.googleapis.com",
    "notebooks.googleapis.com",
    "artifactregistry.googleapis.com",
    "compute.googleapis.com",
    "sqladmin.googleapis.com",
    "servicenetworking.googleapis.com",
    "secretmanager.googleapis.com",
    "run.googleapis.com",
    "cloudbuild.googleapis.com",
    "containeranalysis.googleapis.com"
  ]
}

resource "google_project_service" "services" {
  for_each = toset(var.services)
  service  = each.value
}
