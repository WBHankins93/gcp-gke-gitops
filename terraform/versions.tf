terraform {
  required_version = ">= 1.7.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 5.0"
    }
  }

  backend "gcs" {
    # Don’t hardcode. Pass these via -backend-config or TF_VARs:
    # bucket = "your-tf-state-bucket"
    # prefix = "gcp-gke-gitops/state"
  }
}
