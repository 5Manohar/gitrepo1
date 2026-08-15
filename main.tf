resource "google_compute_network" "training_vpc" {
  name                    = "github-actions-training-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "training_subnet" {
  name          = "github-actions-training-subnet"
  ip_cidr_range = "10.10.0.0/24"
  region        = var.region
  network       = google_compute_network.training_vpc.id
}

resource "google_compute_firewall" "allow_http_ssh" {
  name    = "allow-http-ssh-training"
  network = google_compute_network.training_vpc.name

  allow {
    protocol = "tcp"
    ports    = ["22", "80"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["web"]
}

resource "google_compute_instance" "web_vm" {
  name         = var.vm_name
  machine_type = var.machine_type
  zone         = var.zone
  tags         = ["web"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.training_subnet.id

    access_config {}
  }

  metadata_startup_script = file("${path.module}/startup.sh")
}