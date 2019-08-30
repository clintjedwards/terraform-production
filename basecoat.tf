resource "google_compute_instance" "basecoat" {
  provider            = "google"
  name                = "basecoat"
  machine_type        = "f1-micro"
  deletion_protection = "true"
  hostname            = "basecoat.clintjedwards.com"
  metadata            = {}
  labels = {
    "basecoat" = ""
  }
  tags = [
    "basecoat"
  ]

  boot_disk {
    initialize_params {
      image = "debian-9-stretch-v20190326"
    }
  }

  network_interface {
    access_config {
      nat_ip       = "35.190.189.209"
      network_tier = "PREMIUM"
    }
  }

  service_account {
    email = "production-161206@appspot.gserviceaccount.com"
    scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }
}
