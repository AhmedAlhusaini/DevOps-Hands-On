terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.20.0"
    }
  }
}

provider "aws" {
  # Configuration options
  shared_config_files      = ["./shared_config_files/conf"]
  shared_credentials_files = ["./shared_credentials_files/creds"]
  profile                  = "enterprise"
}
# To test the configuration, you can run the following command in your terminal:
	# AWS_CONFIG_FILE=./shared_config_files/conf \
	# AWS_SHARED_CREDENTIALS_FILE=./shared_credentials_files/creds \
	# aws sts get-caller-identity --profile enterprise --region us-west-2
