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
    "24.90.225.35/32",   //Unknown
    "71.190.170.86/32",  //Unknown
    "68.192.182.120/32", //Unknown
    "104.132.34.100/32", //Unknown
    "74.73.54.40/32",    //Stagg st
  ]
}

