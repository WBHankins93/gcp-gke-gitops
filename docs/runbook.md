# Runbook v1

## Auth and project
```bash
gcloud auth login
gcloud config set project <PROJECT_ID>
```

## Terraform workflow
```bash
make init
make plan
make apply
```

## Kubernetes access
```bash
make get-creds
kubectl get nodes -o wide
```

## Bootstrap namespaces & RBAC (once per cluster)
```bash
kubectl apply -f k8s/platform/namespaces.yaml
kubectl apply -f k8s/platform/rbac-app-dev.yaml
```

## Install Argo CD (pinned version)
```bash
kubectl apply -f k8s/argocd/install/namespace.yaml
```

```bash
# Pinned upstream manifest:
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/v2.11.3/manifests/install.yaml
kubectl -n argocd get pods
```

## Register GitOps apps
# hello-web app (from this repo)
```bash
kubectl apply -n argocd -f k8s/argocd/apps/hello-web.yaml
```

# monitoring stack (Helm via Argo)
```bash
kubectl apply -n argocd -f k8s/argocd/apps/monitoring.yaml
```

## Port forwards for demo
```bash
make pf-hello      # http://localhost:8080
make pf-grafana    # http://localhost:3000  user: admin  pass: admin (temp)
```

## Teardown
```bash
make destroy
# Optionally uninstall Argo:
kubectl delete -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/v2.11.3/manifests/install.yaml
kubectl delete ns argocd
```