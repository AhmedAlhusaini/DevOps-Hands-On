######################################################
# 1- Resource Tainting Example
# terraform taint "aws_instance.myec2"
# terraform apply -replace="aws_instance.myec2" 
######################################################
# 2- Debug Example
# export TF_LOG=TRACE
# export TF_LOG_PATH=./logs.txt 
#####################################################

terraform {
  backend "s3" {
	bucket         = "my-terraform-state"
	key            = "prod/terraform.tfstate"
	region         = "us-east-1"
	dynamodb_table = "terraform-locks"
	encrypt        = true
  }
}
provider "aws" {
  region = "us-east-1"
}
