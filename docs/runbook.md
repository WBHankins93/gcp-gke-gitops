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

## Port forwards for demo
```bash
make pf-hello      # http://localhost:8080
make pf-grafana    # http://localhost:3000  user: admin  pass: admin (temp)
```

## Teardown
```bash
make destroy
```