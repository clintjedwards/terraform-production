resource "google_compute_firewall" "semi-external-web-service" {
  name        = "semi-external-web-service"
  description = "Firewall that allows only certain ip addresses to access web services"
  network     = "default"
  target_tags = ["basecoat"]

  allow {
    protocol = "tcp"
    ports = [
      "22",  //ssh
      "80",  //http
      "443", //https
      "4444" //metrics
    ]
  }

  //source_ranges are source filters in the UI
  source_ranges = [
    "71.190.170.86/32",  // Holbro
    "71.190.142.124/32", // Graham Ave
    "68.192.182.120",    // 1285
    //"216.15.59.9",       // Caroline
  ]
}

