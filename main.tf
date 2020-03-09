resource "google_service_account" "prezly_service_account" {
  account_id = lower(local.prezly)
}

module "prezly_trigger" {
  source = "./trigger"
  project = var.project
  region = "us-east1"
  service = local.prezly
  service_account = google_service_account.prezly_service_account.email
  endpoint = var.prezly-endpoint
  source_bucket = google_storage_bucket.source.name
}