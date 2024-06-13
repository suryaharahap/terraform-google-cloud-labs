terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.33.0"
    }
  }
}

provider "google" {
  project = "devops-422816"
  region  = "asia-southeast2"
  zone    = "asia-southeast2-a"
}

resource "google_compute_instance" "terraform" {
  name         = "terraform"
  machine_type = "e2-medium"
  tags         = ["web", "dev", "surya"]
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }
  allow_stopping_for_update = true
}
