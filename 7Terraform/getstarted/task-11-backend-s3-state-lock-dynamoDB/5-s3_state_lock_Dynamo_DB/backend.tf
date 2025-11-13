terraform {
  backend "s3" {
    bucket         = "dolfined123456789"
    key            = "dev/terrform.tfstate"
    region         = "us-east-2"
    profile        = "dev_admin"
    dynamodb_table = "state_lock_table"
  }
}
