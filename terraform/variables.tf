variable "prefix" {
  type = string

  validation {
    condition     = startswith(var.prefix, "gcp-")
    error_message = "Provide valid prefix starting with gcp-."
  }
}


variable "gcp_project_id" {
  type        = string
  description = "The ID of the Google Cloud Project."

  validation {
    condition     = can(regex("^[a-z][a-z0-9-]{4,28}[a-z0-9]$", var.gcp_project_id))
    error_message = "The project ID must start with a lowercase letter, be between 6 and 30 characters long, contain only lowercase letters, numbers, and hyphens, and end with a lowercase letter or number."
  }
}

variable "gcp_region" {
  type        = string
  description = "The Google Cloud region for resources."

  validation {
    condition     = can(regex("^[a-z]{2,12}-[a-z]+[0-9]{1}$", var.gcp_region))
    error_message = "Invalid GCP region. Please choose from the available regions."
  }
}
