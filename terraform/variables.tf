variable "project_id" {
  description = "The GCP project ID where resources will be created"
  type        = string
}

variable "region" {
  description = "The GCP region where resources will be created"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "The GCP zone where resources will be created"
  type        = string
  default     = "us-central1-a"
}

variable "environment" {
  description = "Environment name (e.g., dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "cluster_name" {
  description = "Name of the GKE cluster"
  type        = string
  default     = "gke-cluster"
}

variable "labels" {
  description = "Labels to apply to resources"
  type        = map(string)
  default = {
    project     = "gcp-gke-gitops"
    managed-by  = "terraform"
  }
}
