#!/bin/bash
# Preparation script for Terraform and AWS CLI aliases
#source .cmdprep.sh
#To auto-load it every time, add this to your ~/.bashrc or ~/.bash_profile:
# Load project-specific aliases
		# if [ -f "/d/Enterprise Solutions/01 CloudAndDevOps/devops-track-on-the-run/7Terraform/.cmdprep.sh" ]; then
		#     source "/d/Enterprise Solutions/01 CloudAndDevOps/devops-track-on-the-run/7Terraform/.cmdprep.sh"
		# fi

# Terraform aliases
alias ti='terraform init'
alias tp='terraform plan'
alias ta='terraform apply'
alias td='terraform destroy'
alias tv='terraform validate'
alias tf='terraform fmt'
alias to='terraform output'
alias taa='terraform apply -auto-approve'
alias tda='terraform destroy -auto-approve'

# AWS STS with custom config/creds
alias awsid='AWS_CONFIG_FILE=./shared_config_files/conf AWS_SHARED_CREDENTIALS_FILE=./shared_credentials_files/creds aws sts get-caller-identity --profile default --region us-west-2'

# Optional: Git helpers
alias gs='git status'
alias ga='git add .'
alias gc='git commit -m'
alias gp='git push'
alias gl='git log --oneline --graph --decorate --all'
alias gco='git checkout'