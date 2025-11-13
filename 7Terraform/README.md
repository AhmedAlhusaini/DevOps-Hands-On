terraform-project/
├── .prep.sh                     # Your alias and shell prep script
├── README.md                    # Project overview and usage instructions
├── main.tf                      # Entry point (can be minimal or empty)
├── versions.tf                  # Terraform and provider version constraints
├── variables.tf                 # Global variables (if any)
├── outputs.tf                   # Global outputs (if any)
├── res/                         # Modular resources (reusable across envs)
│   ├── ec2/
│   │   ├── main.tf              # EC2 instance logic
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── s3/
│   ├── vpc/
│   └── iam/
├── env/                         # Environment-specific deployments
│   ├── std/
│   │   ├── main.tf              # Calls modules from ../res
│   │   ├── terraform.tfvars     # Env-specific variable values
│   │   └── backend.tf           # Remote state config (optional)
│   ├── dev/
│   ├── prod/
│   └── qa/
├── modules/                     # Optional: reusable modules (if not using res/)
│   └── network/
├── shared_config_files/         # Custom AWS config
│   └── conf
├── shared_credentials_files/    # Custom AWS credentials
│   └── creds
└── .terraform.lock.hcl          # Dependency lock file (auto-generated)
