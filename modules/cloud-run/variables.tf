variable "location" {
  type = string
}

variable "serena-backend-image" {
  type    = string
  default = "asia-southeast2-docker.pkg.dev/serena-777/cloud-run-source-deploy/serena-backend/serena-backend"
}

variable "serena-backend-sa-email" {
  type = string
}
