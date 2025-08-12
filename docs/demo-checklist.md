# TODO - finish step 6 to wrap up MVP

# Demo Checklist (15–30 min window)

## Prep (no cost)
- [ ] Confirm repo branch: `workflows` -> open PR to `main` when ready
- [ ] Ensure GitHub repo variables/secrets ready (WIF provider, TF SA) — not used until apply
- [ ] Local: logged into `gcloud` and project set

## Run (cost window starts)
- [ ] Enable CI "apply" mode (we’ll toggle tomorrow)
- [ ] Merge PR to `main` (Terraform applies)
- [ ] `make get-creds` succeeds
- [ ] `kubectl apply` platform + Argo namespace
- [ ] Install Argo CD (pinned)
- [ ] Apply Argo Applications (hello-web, monitoring)
- [ ] Port-forward hello-web (200 OK)
- [ ] Port-forward Grafana (dashboard loads)

## Capture
- [ ] Screenshots: GH Actions run, GKE nodes, Argo apps “Healthy/Synced”, hello-web page, Grafana

## Teardown (stop cost)
- [ ] `make destroy` completes
- [ ] Delete Argo CD and namespaces if needed