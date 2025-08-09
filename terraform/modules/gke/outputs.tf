output "name"     { value = google_container_cluster.this.name }
output "endpoint" { value = google_container_cluster.this.endpoint }
output "location" { value = google_container_cluster.this.location }
output "ca_cert"  { value = google_container_cluster.this.master_auth[0].cluster_ca_certificate }
