output "serena-notebook-sa-email" {
  value = google_service_account.serena-notebook.email
}

output "serena-backend-sa-email" {
  value = google_service_account.serena-backend.email
}

output "serena-cloud-build-sa-email" {
  value = google_service_account.serena-cloud-build.email
}

output "serena-cloud-build-sa-id" {
  value = google_service_account.serena-cloud-build.id
}


