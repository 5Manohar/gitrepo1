terraform {
  backend "gcs" {
    bucket = "project-97276faf-460e-4e5f-a7b-tf-state"
    prefix = "terraform/3-vm-practice"
  }
}
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}