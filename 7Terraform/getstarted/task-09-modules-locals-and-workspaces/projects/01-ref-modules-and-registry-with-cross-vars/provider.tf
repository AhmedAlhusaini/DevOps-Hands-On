terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.20.0"
    }
  }
}

provider "aws" {
  shared_config_files      = ["../../../../../providers/aws/aws_shared_config_files/conf"]
  shared_credentials_files = ["../../../../../providers/aws/aws_shared_credentials_files/creds"]
  profile                  = "enterprise"
}
