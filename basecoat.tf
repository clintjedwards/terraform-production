resource "basecoat" "vm_instance" {
  provider     = "google"
  name         = "basecoat"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-9-stretch-v20190326"
    }
  }
}
