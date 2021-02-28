resource "google_compute_firewall" "certbot" {
  name        = "certbot"
  description = "Certbot creates SSL certificates, it uses nginx to communicate over port 80 when needed"
  network     = "default"
  target_tags = ["basecoat", "scheduler"]

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  //source_ranges are source filters in the UI
  source_ranges = [
    "0.0.0.0/0", //Everywhere
  ]
}
