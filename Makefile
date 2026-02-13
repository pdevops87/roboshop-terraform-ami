gt github:
  git pull

a apply:
  terraform init
  terraform apply -auto-approve

d destroy:
  terraform init
  terraform destroy -auto-approve