resource "google_compute_instance" "vm" {

  count = var.vm_count

  name         = "terraform-vm-${count.index + 1}"
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network = "default"

    access_config {
    }
  }
}