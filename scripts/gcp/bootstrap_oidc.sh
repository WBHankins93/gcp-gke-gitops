#!/usr/bin/env bash
set -euo pipefail

PROJECT_ID="${PROJECT_ID:-gcp-gke-gitops}"
GITHUB_REPO="${GITHUB_REPO:-WBHankins93/gcp-gke-gitops}"
WIP_NAME="${WIP_NAME:-github-wip}"
WIP_PROVIDER="${WIP_PROVIDER:-github-provider}"
SA_NAME="${SA_NAME:-terraform-ci}"

echo ">> Using PROJECT_ID=$PROJECT_ID, GITHUB_REPO=$GITHUB_REPO"
PROJECT_NUMBER="$(gcloud projects describe "$PROJECT_ID" --format="value(projectNumber)")"

# Pool
gcloud iam workload-identity-pools describe "$WIP_NAME" --location=global --project="$PROJECT_ID" >/dev/null 2>&1 || \
gcloud iam workload-identity-pools create "$WIP_NAME" \
  --project="$PROJECT_ID" --location=global --display-name="GitHub Actions Pool"

# Provider
if ! gcloud iam workload-identity-pools providers describe "$WIP_PROVIDER" \
  --workload-identity-pool="$WIP_NAME" --location=global --project="$PROJECT_ID" >/dev/null 2>&1; then
  gcloud iam workload-identity-pools providers create-oidc "$WIP_PROVIDER" \
    --project="$PROJECT_ID" --location=global --workload-identity-pool="$WIP_NAME" \
    --display-name="GitHub Actions OIDC" \
    --issuer-uri="https://token.actions.githubusercontent.com" \
    --attribute-mapping="attribute.repository=assertion.repository,attribute.ref=assertion.ref,google.subject=assertion.sub" \
    --attribute-condition="attribute.repository==\"$GITHUB_REPO\""
fi

# Service account
gcloud iam service-accounts describe "${SA_NAME}@${PROJECT_ID}.iam.gserviceaccount.com" --project="$PROJECT_ID" >/dev/null 2>&1 || \
gcloud iam service-accounts create "$SA_NAME" --project="$PROJECT_ID" --display-name="Terraform CI"

# Workload Identity binding
gcloud iam service-accounts add-iam-policy-binding \
  "${SA_NAME}@${PROJECT_ID}.iam.gserviceaccount.com" \
  --project="$PROJECT_ID" \
  --role="roles/iam.workloadIdentityUser" \
  --member="principalSet://iam.googleapis.com/projects/${PROJECT_NUMBER}/locations/global/workloadIdentityPools/${WIP_NAME}/attribute.repository/${GITHUB_REPO}"

echo
echo "=== BOOTSTRAP COMPLETE ==="
echo "Add these GitHub repo secrets:"
echo "  GCP_PROJECT_ID=$PROJECT_ID"
echo "  GCP_PROJECT_NUMBER=$PROJECT_NUMBER"
echo "  GCP_TF_BUCKET=<your-terraform-state-bucket>"
echo "  GCP_TF_SA=${SA_NAME}@${PROJECT_ID}.iam.gserviceaccount.com"
