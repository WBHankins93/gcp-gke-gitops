variable "project_id" { type = string }
variable "region"     { type = string }

variable "vpc_name" {
  type        = string
  default     = "vpc-gitops"
  description = "Name of the VPC network"
}

variable "subnet_name" {
  type        = string
  default     = "subnet-primary"
  description = "Name of the primary subnet"
}

variable "subnet_cidr" {
  type        = string
  default     = "10.0.0.0/24"
  description = "CIDR for primary subnet"
}

variable "pods_cidr" {
  type        = string
  default     = "10.1.0.0/16"
  description = "CIDR for secondary range used by Pods"
}

variable "services_cidr" {
  type        = string
  default     = "10.2.0.0/20"
  description = "CIDR for secondary range used by Services"
}

variable "pods_range_name" {
  type        = string
  default     = "pods-range"
  description = "Name of the secondary range for Pods"
}

variable "services_range_name" {
  type        = string
  default     = "services-range"
  description = "Name of the secondary range for Services"
}

variable "enable_flow_logs" {
  type        = bool
  default     = true
  description = "Enable VPC flow logs on the subnet"
}

variable "labels" {
  type        = map(string)
  default     = {}
  description = "Labels to apply to resources"
}
