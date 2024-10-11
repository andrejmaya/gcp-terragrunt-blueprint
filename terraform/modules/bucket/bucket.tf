resource "google_storage_bucket" "bucket" {
  name          = var.bucket_name
  location      = var.bucket_location
  force_destroy = true

  versioning {
    enabled = true
  }
}

# Output the bucket name for use in the main configuration
output "bucket_name" {
  value = google_storage_bucket.bucket.name
}