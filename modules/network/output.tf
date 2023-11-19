output "serena-net" {
  value = {
    name      = google_compute_network.serena-net.name
    self_link = google_compute_network.serena-net.self_link
    id        = google_compute_network.serena-net.id
  }
}

output "serena-subnet-asia-southeast2" {
  value = {
    name      = google_compute_subnetwork.serena-subnet-asia-southeast2.name
    self_link = google_compute_subnetwork.serena-subnet-asia-southeast2.self_link
  }
}
