/*
1- Create a user with admin access privilages and use this user account to create resources.
2- Using terraform, create two EC2 instances, one in us-east-1 and the other in us-west-1 regions, respectively.
3- Using the AWS Console, create a new EC2 instance in us-east-1 region , tag it with “manually_created”.
4- You are required to control all your resources from terraform on your local machine, Please do the needeful configuration actions to achieve this.
5- At end, your state file should include all the created EC2 instances, please use your terminal to list all your resources without accessing your state file.
6- Your colleague installed unwanted applications on one of your EC2 instances manually using the AWS Console and you want to revert its earlier state, what could you do to maintain the desired state of that instance? Please do the needful action.
Finally, destroy your deployed infrastructure.

*/


provider "aws" {
alias = "useast"
shared_config_files      = ["../../../shared_config_files/conf"]
shared_credentials_files = ["../../../shared_credentials_files/creds"]
profile                  = "enterprise"
}

provider "aws" {
  alias                    = "uswest"
shared_config_files      = ["../../../shared_config_files/conf"]
shared_credentials_files = ["../../../shared_credentials_files/creds"]
  profile = "dev" 
}


############################################################
#                      #EC2 INSTANCES                     #
############################################################

resource "aws_instance" "east_instance" {
  provider      = aws.useast
  ami           = var.east_ami_id
  instance_type = var.ec2_instance_type
  tags = {
    Name = "east-instance"
  }
}

resource "aws_instance" "west_instance" {
  provider      = aws.uswest
  ami           = var.west_ami_id
  instance_type = var.ec2_instance_type
  tags = {
    Name = "west-instance"
  }
}




######### Commands #######: 
# terraform init
# terraform apply -auto-approve
# create the maunally EC2 instance and then use the other file configuration to import it under terraform control.
# terraform state list
# terraform apply -auto-approve >>>>> to maintain the desired state and ignore any manual changes.
# terraform destroy -auto-destroy
