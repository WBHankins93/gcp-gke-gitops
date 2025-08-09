# network module

Creates a dedicated VPC with:
- One primary subnet
- Secondary IP ranges for Pods and Services (for VPC‑native GKE)
- Cloud Router + Cloud NAT for egress
- Flow logs (subnet + NAT) enabled by default

**Outputs** expose names/self_links and the secondary range names, which are passed to the GKE module.
