terraform {
  backend "s3" {
    bucket  = "dolfined123456789"
    key     = "network/terraform.tfstate"
    region  = "us-east-2"
    profile = "dev_admin"

  }
}
