module "stack" {
  source = "../.."
  project_id   = var.project_id
  region       = var.region
  zone         = var.zone
  cluster_name = var.cluster_name
  labels       = var.labels
}
