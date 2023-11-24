variable "location" {
  type = string
}

variable "serena-backend-image" {
  type    = string
  default = "asia-southeast2-docker.pkg.dev/serena-777/cloud-run-source-deploy/serena-backend/serena-backend:01751c83c6a310cd897d0de7a6787e2930765f53"
}

variable "serena-backend-sa-email" {
  type = string
}
