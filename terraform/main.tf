locals {
  vpc_name              = "vpc-gitops"
  subnet_name           = "subnet-primary"
  pods_range_name       = "pods-range"
  services_range_name   = "services-range"
}

module "network" {
  source = "./modules/network"

  project_id  = var.project_id
  region      = var.region

  vpc_name    = local.vpc_name
  subnet_name = local.subnet_name

  # Primary & secondary CIDRs (safe defaults; change if needed)
  subnet_cidr    = "10.0.0.0/24"
  pods_cidr      = "10.1.0.0/16"
  services_cidr  = "10.2.0.0/20"

  pods_range_name     = local.pods_range_name
  services_range_name = local.services_range_name

  enable_flow_logs = true
  labels           = var.labels
}
