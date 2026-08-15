terraform {
  backend "gcs" {
    bucket = "demononprod-tf-state"
    prefix = "github-actions-training"
  }
}