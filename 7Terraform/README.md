
# 🚀 Terraform Hands-On Guide

Welcome to the **Terraform Hands-On Lab**! This repo is designed to help you learn Terraform like a pro — starting with simple tasks, then gradually building up to full project structures, reusable modules, and advanced workflows.

---

## 📌 Prerequisites
- Install [Terraform](https://developer.hashicorp.com/terraform/downloads) (v1.5+ recommended).
- Configure cloud provider credentials (AWS, Azure, etc.).
- Basic knowledge of CLI and Git.

---

## 🟢 Step 1: Start Simple
Begin with the **getstarted** folder:
```bash
cd 7Terraform/getstarted
terraform init
terraform plan
terraform apply
```
- `main.tf` → defines a basic resource (like EC2 or S3).  
- `variables.tf` → input variables.  
- `outputs.tf` → outputs after deployment.  

👉 This helps you understand the **Terraform workflow**: *init → plan → apply → destroy*.

---

## 🟡 Step 2: Project Structure
The repo follows a **professional layout**:
```
7Terraform/
├── main.tf              # Entry point
├── versions.tf          # Terraform + provider versions
├── variables.tf         # Global variables
├── outputs.tf           # Global outputs
├── env/                 # Environment-specific configs (dev, prod, qa)
├── modules/             # Reusable modules
├── resources/           # Resource definitions (ec2, s3, vpc, etc.)
├── providers/           # Cloud provider configs
├── backend/             # Remote state configs
└── vault/               # Security integrations
```

This structure separates **resources**, **modules**, and **environments**, making it scalable and team-friendly.

---

## 🔵 Step 3: Use Modules
Modules let you **reuse code**:
```hcl
module "ec2_instance" {
  source   = "../resources/ec2"
  instance_type = var.instance_type
}
```
- Place reusable logic in `modules/`.  
- Call modules from `env/dev/main.tf` or `env/prod/main.tf`.  
- This ensures consistency across environments.

---

## 🟣 Step 4: Manage Environments
Each environment (`env/dev`, `env/prod`, `env/qa`) has:
- `main.tf` → calls modules/resources.  
- `terraform.tfvars` → environment-specific values.  
- `backend.tf` → remote state configuration.  

👉 Run Terraform per environment:
```bash
cd env/dev
terraform init
terraform apply
```

---

## 🔴 Step 5: Advanced Practices
- **Remote State**: Configure `backend.tf` to store state in S3 or Azure Blob.  
- **Providers**: Use `providers.tf` to manage AWS, Azure, or multi-cloud setups.  
- **Vault**: Secure secrets with HashiCorp Vault (`vault/`).  
- **Scripts**: Automate workflows with helper scripts in `scripts/`.

---

## ✅ Best Practices
- Always run `terraform fmt` for clean code.  
- Use `terraform validate` before applying.  
- Keep secrets out of Git — use `.gitignore` and Vault.  
- Document modules and variables for team onboarding.  

---

## 📚 Learning Path
1. **Simple resources** → `getstarted/`  
2. **Project structure** → `main.tf`, `variables.tf`, `outputs.tf`  
3. **Reusable modules** → `modules/` + `resources/`  
4. **Environment configs** → `env/dev`, `env/prod`  
5. **Advanced workflows** → `backend/`, `vault/`, `scripts/`

