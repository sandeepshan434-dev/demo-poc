terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "8.0.0"
    }
  }
}

provider "google" {
  # Configuration options
}

resource "google_storage_bucket" "demo-tf-sandeep" {
 
  name          = "demo-tf-sandeep"
  location      = "US"
  force_destroy = true

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      days_since_noncurrent_time = 3
      send_age_if_zero = false
    }
  }
}
