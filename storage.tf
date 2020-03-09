resource "google_storage_bucket" "source" {
  name = var.project
}

resource "google_storage_bucket" "cdn_bucket" {
  name = "${var.project}-cdn"
}

resource "google_storage_bucket_object" "modal" {
  bucket = google_storage_bucket.cdn_bucket.name
  name = "modal/"
  content = ".empty"
}

resource "google_storage_bucket_acl" "cdn_bucket_acl" {
  bucket = google_storage_bucket.cdn_bucket.name
  role_entity = [
    "READER:allUsers",
  ]
}

resource "google_storage_bucket" "prezly" {
  name = "${var.project}-prezly"
}

resource "google_storage_notification" "prezly_notification" {
  bucket = "${var.project}-prezly"
  payload_format = "JSON_API_V1"
  topic = local.prezly
  event_types = ["OBJECT_FINALIZE", "OBJECT_METADATA_UPDATE"]
  depends_on = [google_pubsub_topic_iam_binding.prezly_binding]
}

data "google_storage_project_service_account" "gcs_account" {
}

resource "google_pubsub_topic_iam_binding" "prezly_binding" {
  topic   = local.prezly
  role    = "roles/pubsub.publisher"
  members = ["serviceAccount:${data.google_storage_project_service_account.gcs_account.email_address}"]
}