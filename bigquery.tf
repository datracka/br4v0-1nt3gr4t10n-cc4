resource "google_bigquery_dataset" "prezly_dataset" {
  dataset_id = "prezly"
}

resource "google_bigquery_table" "contacts" {
  dataset_id = google_bigquery_dataset.prezly_dataset.dataset_id
  table_id = "contacts"
  schema = file("${path.module}/contacts_schema.json")
}