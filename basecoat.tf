resource "google_compute_address" "basecoat" {
  name         = "basecoat"
  region       = "us-east1"
  network_tier = "STANDARD"
}

resource "google_compute_instance" "basecoat" {
  provider            = google
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
    network = "default"

    access_config {
      nat_ip       = google_compute_address.basecoat.address
      network_tier = "STANDARD"
    }
  }

  service_account {
    email = "production-161206@appspot.gserviceaccount.com"
    scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }
}
