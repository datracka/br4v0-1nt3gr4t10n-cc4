terraform {
  backend "gcs" {
    bucket = "bravo-terraform-state"
    prefix = "bravo-cca"
  }
}

