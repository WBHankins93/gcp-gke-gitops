BUCKET ?= gs://gitops-project-bucket
TF_DIR ?= terraform/overlays/dev

init:
	cd $(TF_DIR) && terraform init

plan:
	cd $(TF_DIR) && terraform plan -var-file=dev.tfvars -out=plan.tfplan

apply:
	cd $(TF_DIR) && terraform apply -auto-approve plan.tfplan || true

destroy:
	cd $(TF_DIR) && terraform destroy -auto-approve -var-file=dev.tfvars

get-creds:
	gcloud container clusters get-credentials $(shell terraform -chdir=$(TF_DIR) output -raw cluster_name) --region $(shell terraform -chdir=$(TF_DIR) output -raw region)

pf-grafana:
	kubectl -n monitoring port-forward svc/kube-prometheus-stack-grafana 3000:80

pf-hello:
	kubectl -n app-dev port-forward svc/hello-web 8080:80
