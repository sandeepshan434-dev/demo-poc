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
resource "google_cloud_run_service" "demo-cloud-run-sandy" {
  name     = "demo-cloud-run-sandy"
  location = "us-central1"

  template {
    spec {
      containers {
        image = "us-docker.pkg.dev/cloudrun/container/hello"
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}
