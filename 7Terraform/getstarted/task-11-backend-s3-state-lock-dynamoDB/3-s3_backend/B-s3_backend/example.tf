provider "aws" {
  region  = "us-east-2"
  profile = "dev_admin"
}
resource "aws_iam_user" "lb" {
  name  = "dev_user${count.index}"
  count = 3
  path  = "/system/"
}
