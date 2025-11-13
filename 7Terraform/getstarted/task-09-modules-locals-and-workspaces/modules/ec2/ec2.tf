resource "aws_instance" "dev-instance-web" {
  ami           = "ami-03f38e546e3dc59e1"
  instance_type = local.dev_ec2_instance
  count = local.dev_instance_count
  tags = {
	name=join("-", [local.dev_project_name,local.environment,count.index])
	"project name" =local.dev_project_name
	"owner"=local.projects_owners["dev"]
  }
  
  }

##overwrite with variables 

resource "aws_instance" "prod-instance-web" {
  ami           = "ami-03f38e546e3dc59e1"
  instance_type = var.prod_ec2_instance
  #instance_type = "t2.meduim"
  count= var.prd_instance_count
  tags = {
	name="${local.prod_ec2_instance_name}-${local.prod_any_variable_test}-${count.index}"
	"project name" =local.prod_project_name
	"owner"=local.projects_owners["prd"]

  }
  
  }


locals {
  dev_ec2_instance = "t2.nano"
  prod_ec2_instance_name="Hamo"
  prod_any_variable_test="production"
  dev_project_name   = "myapp-dev"
  prod_project_name   = "myapp-prd"
  environment    = "dev"
  dev_instance_count = 2
  #tags key are case senstive 
  projects_owners={
	dev="Ahmed",
	prd="Alhusainy"
  }
}
