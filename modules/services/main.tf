variable "services" {
  type = list(string)
  default = [
    "cloudresourcemanager.googleapis.com",
    "iam.googleapis.com",
    "compute.googleapis.com",
    "aiplatform.googleapis.com",
    "notebooks.googleapis.com",
    "artifactregistry.googleapis.com",
    "compute.googleapis.com"
  ]
}

resource "google_project_service" "services" {
  for_each = toset(var.services)
  service  = each.value
}
