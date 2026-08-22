variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "GCP zone"
  type        = string
  default     = "us-central1-a"
}

variable "machine_type" {
  description = "Machine type"
  type        = string
  default     = "e2-micro"
}

variable "vm_count" {
  description = "Number of VMs"
  type        = number
  default     = 3
}

variable "image" {
  description = "Operating system image"
  type        = string
  default     = "debian-cloud/debian-12"
}