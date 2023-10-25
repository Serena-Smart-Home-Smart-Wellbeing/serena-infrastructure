resource "google_compute_router" "serena-default-router" {
  name    = "serena-default-router"
  region  = google_compute_subnetwork.serena-subnet-asia-southeast2.region
  network = google_compute_network.serena-net.id

  bgp {
    asn = 64514
  }
}

resource "google_compute_router_nat" "serena-default-router-nat" {
  name                               = "serena-default-router-nat"
  router                             = google_compute_router.serena-default-router.name
  region                             = google_compute_router.serena-default-router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
}
