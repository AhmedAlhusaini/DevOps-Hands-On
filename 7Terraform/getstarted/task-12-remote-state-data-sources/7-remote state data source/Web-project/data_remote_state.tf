data "terraform_remote_state" "eip" {
  backend = "s3"
  config = {
    bucket  = "dolfined123456789"
    key     = "network/eip.tfstate"
    region  = "us-east-2"
    profile = "dev_admin"
  }
}
