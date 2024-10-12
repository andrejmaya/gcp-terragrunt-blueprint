terraform {
  source = "./terraform"
}


locals {
  application      = "gcp-blueprint-code"
  environment_name = "temp"
  team_name        = "reply"
  repository       = "gcp-terragrunt-blueprint"
  prefix           = "gcp-expl"

  # Extract the variables we need for easy access
  gcp_region     = "europe-west3"
  gcp_project_id = "sandbox-andrejmaya"
}

# Configure Terragrunt to automatically store tfstate files in an S3 bucket
remote_state {
  backend = "gcs"

  config = {
    bucket   = "${local.prefix}-terraform-state-${local.gcp_region}"
    prefix   = "${path_relative_to_include()}/terraform.tfstate"
    project  = "${local.gcp_project_id}"
    location = "${local.gcp_region}"
  }
}

generate "terraform" {
  path      = "terraform.tf"
  if_exists = "overwrite"
  contents  = <<EOF
terraform {
  backend "gcs" {}
  required_version = ">= 1.6.3"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.0.0"
    }
  }
}

provider "google" {
  project = "${local.gcp_project_id}"
  region = "${local.gcp_region}"
  default_labels = {
    application         = "${local.application}"
    environment_name    = "${local.environment_name}"
    team_name           = "${local.team_name}"
    repository          = "${local.repository}"
  }
}

EOF
}
#prevent_destroy = true

inputs = {
  gcp_project_id = "${local.gcp_project_id}"
  gcp_region     = "${local.gcp_region}"
  prefix         = "${local.prefix}"
}