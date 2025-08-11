terraform {
  backend "gcs" {
    bucket = "gitops-project-bucket"
    prefix = "envs/dev"
  }
}
