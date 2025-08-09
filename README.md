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

> This initial commit is **Step 1: skeleton + README**. Subsequent steps will add Terraform, CI, Argo, and monitoring incrementally.

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

## Prerequisites (coming soon)

- **GCP:** Project ID, billing enabled, owner/editor role for bootstrap.
- **Local tooling:** `gcloud`, `terraform >= 1.7`, `kubectl`, `helm`.
- **GitHub:** Ability to configure OIDC with a GCP Workload Identity Provider.

> Detailed bootstrap steps will be added in Step 2 (Terraform core).

## Interview Notes (Why & How)

- **Why this approach?** It mirrors a realistic platform slice: infra → delivery → ops.
- **Security first:** OIDC & Workload Identity avoid static credentials and reduce blast radius.
- **Day‑2 thinking:** SLOs/alerts + destroy path emphasize operability, not just deployment.
- **Upskilling story:** Transferrable IaC/K8s skills applied to GCP with fast learning loops.

