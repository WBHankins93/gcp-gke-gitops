# gcp-gke-gitops

A focused, end-to-end platform slice on **Google Cloud (GCP)** using **Terraform** (IaC), **GKE** (Kubernetes), and **GitOps** (Argo CD). The goal is to demonstrate practical, aligned skills across infrastructure, delivery, and day‑2 operations with a clear security posture.

## Why

- **GCP-first:** Uses GKE, Google IAM, Workload Identity, and Artifact Registry.
- **Security:** GitHub OIDC → GCP (no long‑lived creds), least‑privilege service accounts.
- **Operate-ability:** Prometheus stack + SLO example (availability/latency) and alerts.
- **Governance:** Terraform plan/apply with checks (fmt/validate, tfsec/checkov).

## Scope (What this repo will contain)

- **Infra:** VPC, subnet(s), NAT, private GKE, Workload Identity, minimal IAM, Artifact Registry.
- **Delivery:** GitHub Actions → Terraform via OIDC; Argo CD manages app manifests.
- **Observability:** Prometheus Operator, kube-state-metrics, example SLO/alert rules.
- **Docs & Runbooks:** How to deploy, destroy, and reason about design choices.


## Repository Structure (evolving)

```
gcp-gke-gitops/
├─ README.md
├─ terraform/                # IaC (providers, modules, env wiring)
│  └─ modules/               # network, gke, iam (to be added)
├─ .github/workflows/        # CI for terraform (to be added)
├─ argo/                     # ArgoCD app & sample app (to be added)
├─ monitoring/               # Prometheus/Grafana & SLOs (to be added)
└─ docs/                     # Diagrams, workflow notes
```

## Roadmap (Step-by-step)

1. **Repo init + README**
2. **Terraform core:** backend, providers, variables, versions.
3. **Network module:** VPC, subnet, NAT.
4. **GKE module:** private cluster, nodepool, Workload Identity.
5. **CI pipeline:** GitHub Actions OIDC → GCP; fmt/validate/plan + tfsec.
6. **Argo CD + sample app:** simple web app + HPA; drift-free sync.
7. **Monitoring:** Prometheus Operator + SLO rule + alert example.
8. **Docs:** architecture diagram + workflow and runbook.
9. **Tighten IAM:** least-privilege for Terraform SA and Argo SA.

## Prerequisites

- **GCP:** Project ID, billing enabled, owner/editor role for bootstrap.
- **Local tooling:** `gcloud`, `terraform >= 1.7`, `kubectl`, `helm`.
- **GitHub:** Ability to configure OIDC with a GCP Workload Identity Provider.

### Prerequisite: Enable Required GCP APIs
Before creating the GKE cluster, the following Google Cloud APIs must be enabled in your project. These APIs allow Terraform to provision compute, networking, IAM, and Kubernetes resources.

```bash
gcloud services enable \
  container.googleapis.com \
  compute.googleapis.com \
  iam.googleapis.com \
  cloudresourcemanager.googleapis.com
```

What each API is for
| API | Purpose |
| --- | ------- |
| **Kubernetes Engine API** (`container.googleapis.com`) | Allows creation and management of GKE clusters |
| **Compute Engine API** (`compute.googleapis.com`) | Enables VM instances, networking, and load balancers used by GKE |
| **Identity and Access Management (IAM) API** (`iam.googleapis.com`) | Handles service accounts, roles, and Workload Identity bindings |
| **Cloud Resource Manager API** (`cloudresourcemanager.googleapis.com`) | Manages projects, folders, and organization-level metadata |

Example successful output
```text
Operation "operations/acf.p2-888164978125-4a294659-3eeb-4707-8cd4-119f27fbd0a2" finished successfully.
Successfully enabled the following Google Cloud APIs for your gcp-gke-gitops project:
• Kubernetes Engine API (container.googleapis.com)
• Compute Engine API (compute.googleapis.com)
• Identity and Access Management (IAM) API (iam.googleapis.com)
• Cloud Resource Manager API (cloudresourcemanager.googleapis.com)
```

You only need to enable these once per project. If you switch to a different GCP project, re‑run the command.


## Interview Notes (Why & How)

- **Why this approach?** It mirrors a realistic platform slice: infra → delivery → ops.
- **Security first:** OIDC & Workload Identity avoid static credentials and reduce blast radius.
- **Day‑2 thinking:** SLOs/alerts + destroy path emphasize operability, not just deployment.
- **Upskilling story:** Transferrable IaC/K8s skills applied to GCP with fast learning loops.

