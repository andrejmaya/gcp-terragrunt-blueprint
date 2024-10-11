variable "bucket_name" {
  type        = string
  description = "The name of the Terraform state bucket."
}

variable "bucket_location" {
  type        = string
  description = "The location (region) for the Terraform state bucket."
}