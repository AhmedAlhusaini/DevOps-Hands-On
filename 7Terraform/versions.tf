# For terraform & Provider versions 

# terraform {
#   # ...
# }
#############################
# terraform {
#   required_version = "=1.5.0"
# }
########################
terraform {
  # required_providers {
  #   aws = {
  #     version = "= 5.4.0"
  #     source  = "hashicorp/aws"
  #   }
  # }
  required_version = "~>1.4.0"
}
# provider "aws" {
#   region     = "us-west-2"
#   access_key = "my-access-key"
#   secret_key = "my-secret-key"
# }

provider "aws" {
  region                   = "us-east-1"
  shared_config_files      = ["./config"]
  shared_credentials_files = ["./credentials"]
  profile                  = "dolfined_admin"
}

resource "aws_iam_user" "app_user" {
  name  = "app_user"
  path  = "/system/"
  count = 3

  tags = {
    tag-key = "app_user"
  }
}
