resource "google_compute_firewall" "semi-external-web-service" {
  name        = "semi-external-web-service"
  description = "Firewall that allows only certain ip addresses to access web services"
  network     = "default"
  target_tags = ["basecoat"]

  allow {
    protocol = "tcp"
    ports = [
      "22",  //ssh
      "443", //https
      "4444" //metrics
    ]
  }

  //source_ranges are source filters in the UI
  source_ranges = [
    "71.190.170.86/32",  // Holbro
    "108.46.37.98/32",   // Graham Ave
  ]
}

