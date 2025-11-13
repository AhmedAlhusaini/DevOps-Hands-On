provider "aws" {
  region  = "us-east-2"
  profile = "dev_admin"
}
resource "aws_s3_bucket" "mybackend_bucket" {
  bucket = "dolfined123456789"
  tags = {
    Name        = "mybackend_bucket"
    Environment = "prod"
  }
}
