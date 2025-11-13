/*
1- Using Terraform, Create an S3 bucket with a unique name of your choice.
2- The access to this bucket is private.
3- Tag the bucket with the tag “terrform_bucket”.
4- Create a security group which has an inbound permit rule for the 192.168.120.0/24 subnet.
5- Ensure that your settings will restrict terraform to only versions in the range of 1.5.x
6- After creating the above resources, update the tag of your bucket to be “terraform_testbd”, ensure terraform refreshes only the S3 Bucket resource from the resources in the state file. 
7- Destroy the security group resource only and keep the S3 Resource bucket in your deployed infrastrucure. This should be reflected in your state file.
Finally, destroy all your deployed terraform infrastructure.

*/
# terraform setting constrain
terraform {
  required_version = ">= 1.5.0" # ~> 1.5.0

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  shared_config_files      = ["../../../shared_config_files/conf"]
  shared_credentials_files = ["../../../shared_credentials_files/creds"]
  profile                  = "enterprise"
}

# Generate a random suffix for the bucket name to ensure uniqueness
resource "random_id" "bucket_suffix" {
  byte_length = 10
}



# Create an new S3 Bucket resource.
resource "aws_s3_bucket" "my-new-S3-bucket" {
  bucket = "terraform-demo-${random_id.bucket_suffix.hex}"
  tags = {
    Name = "hamoksha_devops_s3_bucket"
  }
lifecycle {
    prevent_destroy = false
  }
}

# Create a new Security group
resource "aws_security_group" "sg_test" {
  name = "sg_test"
  description = "Allow inbound traffic from 192.168.120.0/24"
  vpc_id      = var.vpc_id   # test value = vpc-0a1b2c3d4e5f67890  --> you can get it from your AWS account - default VPC
  ingress {
	description = "Allow all ports from 192.168.120.0/24"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["192.168.120.0/24"]
  }
    tags = {
    Name = "demo_sg"
  }
}


######### Commands #######: 
# terraform init
# terraform plan -out=../../../plans/hello-first-plan.tfplan
# terraform apply -auto-approve
# terraform apply -refresh=false -target aws_s3_bucket.my-new-S3-bucket --auto-approve     >>>>skip the refreshment and apply only the change to S3 bucket.
# terraform destroy -target aws_security_group.sg_test --auto-approve
# terraform destroy -auto-destroy
