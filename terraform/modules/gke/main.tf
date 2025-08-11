resource "google_container_cluster" "this" {
  name     = var.cluster_name
  location = var.zone
  project  = var.project_id
  deletion_protection = false

  network    = var.network_self_link
  subnetwork = var.subnetwork_self_link

  release_channel { channel = var.release_channel }

  # VPC-native: reference secondary ranges by NAME
  ip_allocation_policy {
    cluster_secondary_range_name  = var.pods_range_name
    services_secondary_range_name = var.services_range_name
  }

  remove_default_node_pool = true
  initial_node_count       = 1

  private_cluster_config {
    enable_private_nodes    = var.enable_private_nodes
    enable_private_endpoint = var.enable_private_endpoint
    master_ipv4_cidr_block  = var.master_ipv4_cidr_block
  }

  workload_identity_config {
    workload_pool = "${var.project_id}.svc.id.goog"
  }

  networking_mode = "VPC_NATIVE"

  logging_config {
    enable_components = ["SYSTEM_COMPONENTS","WORKLOADS","APISERVER","SCHEDULER","CONTROLLER_MANAGER"]
  }

  monitoring_config {
    enable_components = ["SYSTEM_COMPONENTS","APISERVER","SCHEDULER","CONTROLLER_MANAGER"]
  }

  resource_labels = var.labels
}

resource "google_container_node_pool" "primary" {
  name       = "np-primary"
  project    = var.project_id
  location   = var.zone
  cluster    = google_container_cluster.this.name
  node_count = var.node_count

  node_config {
    machine_type = var.machine_type
    disk_size_gb = var.disk_size_gb
    disk_type    = var.disk_type

    oauth_scopes = ["https://www.googleapis.com/auth/cloud-platform"]

    metadata = { disable-legacy-endpoints = "true" }
    labels   = var.labels

    shielded_instance_config { enable_secure_boot = true }
  }

  management {
    auto_repair  = true
    auto_upgrade = true
  }
}
