resource "google_storage_bucket" "basic-bucket" {
  name                        = "sandy-basic-demo-bkt"
  location                    = "US"
  storage_class               = "STANDARD"
  uniform_bucket_level_access = true
  force_destroy               = true
}
terraform {
  required_version = ">= 1.5.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0" # Specifies the major version pool
    }
  }
}
