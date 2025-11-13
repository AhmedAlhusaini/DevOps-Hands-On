
provider "aws" {
  shared_config_files      = ["../../../../shared_config_files/conf"]
  shared_credentials_files = ["../../../../shared_credentials_files/creds"]
  profile                  = "enterprise"
}