resource "google_compute_address" "scheduler" {
  name         = "scheduler"
  region       = "us-east1"
  network_tier = "STANDARD"
}

resource "google_compute_instance" "scheduler" {
  provider            = google
  name                = "scheduler"
  machine_type        = "f1-micro"
  zone                = "us-east1-b"
  deletion_protection = "true"
  hostname            = "scheduler.clintjedwards.com"
  metadata            = {}
  labels = {
    "scheduler" = ""
  }
  tags = [
    "scheduler"
  ]

  boot_disk {
    initialize_params {
      size  = 10
      image = "ubuntu-2004-focal-v20210223"
    }
  }

  network_interface {
    network = "default"

    access_config {
      nat_ip       = google_compute_address.scheduler.address
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
