module "bucket" {
  source          = "./modules/bucket"
  bucket_name     = "${var.prefix}-${var.gcp_project_id}-${var.gcp_region}-amaya-bucket-delete-me"
  bucket_location = var.gcp_region
}
