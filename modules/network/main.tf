resource "google_compute_network" "serena-net" {
  name                    = "serena-net"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "serena-subnet-asia-southeast2" {
  name                     = "serena-subnet-asia-southeast2"
  ip_cidr_range            = "10.0.0.0/24"
  region                   = var.GCP_REGION
  network                  = google_compute_network.serena-net.self_link
  private_ip_google_access = true
}

resource "google_compute_firewall" "serena-net-allow-ssh" {
  name    = "serena-net-allow-ssh"
  network = google_compute_network.serena-net.self_link

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = [
    "0.0.0.0/0"
  ]
}
