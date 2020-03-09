variable "project" {
  description = "Google Cloud project id."
}

variable "prezly-endpoint" {
  description = "Google Cloud Run endpoint for phone2action (See: `gcloud beta run services list --platform managed`)"
}

locals {
  prezly = "PrezlyToLytics"
}