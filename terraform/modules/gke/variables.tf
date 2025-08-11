variable "project_id" {
  description = "The GCP project ID where the GKE cluster will be created"
  type        = string
}

variable "region" {
  description = "The GCP region where the GKE cluster will be created"
  type        = string
}

variable "zone" {
  type = string
}

variable "cluster_name" {
  description = "Name of the GKE cluster"
  type        = string
}

variable "network_self_link" {
  description = "Self link of the VPC network to attach the cluster to"
  type        = string
}

variable "subnetwork_self_link" {
  description = "Self link of the subnet to use for the cluster"
  type        = string
}

variable "pods_range_name" {
  description = "Name of the secondary range for GKE pods"
  type        = string
}

variable "services_range_name" {
  description = "Name of the secondary range for GKE services"
  type        = string
}

variable "enable_private_nodes" {
  description = "Enable private GKE nodes (no public IPs)"
  type        = bool
  default     = true
}

variable "enable_private_endpoint" {
  description = "Enable private endpoint for GKE control plane"
  type        = bool
  default     = false
}

variable "master_ipv4_cidr_block" {
  description = "CIDR block for GKE master nodes"
  type        = string
  default     = "172.16.0.0/28"
}

variable "release_channel" {
  description = "Release channel for GKE cluster (RAPID, REGULAR, or STABLE)"
  type        = string
  default     = "REGULAR"
}

variable "node_count" {
  description = "Number of nodes in the GKE node pool"
  type        = number
  default     = 2
}

variable "machine_type" {
  description = "Machine type for GKE nodes"
  type        = string
  default     = "e2-medium"
}

variable "disk_size_gb" {
  description = "Disk size (GB) for GKE node pool instances"
  type        = number
  default     = 20
}

variable "disk_type" {
  description = "Disk type for GKE nodes (pd-standard or pd-ssd)"
  type        = string
  default     = "pd-standard"
}

variable "enable_workload_identity" {
  description = "Enable Workload Identity for Kubernetes service accounts"
  type        = bool
  default     = true
}

variable "labels" {
  description = "Labels to apply to all GKE resources"
  type        = map(string)
  default     = {}
}
