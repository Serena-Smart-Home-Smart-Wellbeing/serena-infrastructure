output "serena-net" {
  value = google_compute_network.serena-net.name

}

output "serena-subnet-asia-southeast2" {
  value = google_compute_subnetwork.serena-subnet-asia-southeast2.name
}
