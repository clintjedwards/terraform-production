provider "google" {
  credentials = "${file("account.json")}"
  project     = "production-161206"
  region      = "us-east1"
  version     = "~> 2.11"
}
