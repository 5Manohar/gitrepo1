terraform {
  backend "gcs" {
    bucket = "project-97276faf-460e-4e5f-a7b-tf-state"
    prefix = "github-actions-training"
  }
}
