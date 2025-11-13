/*
1- Create an IAM user account and assign the name “dolfined_user” to it.
2- Create a new NAT gateway and a new Elastic IP address, and assign it to the new created NAT gateway.
3- Display the EIP public IP on your terminal, also display the dolfined_user arn & NAT gateway ID on your terminal screen.
4- Finally destroy of all your terraform deployed infrastructure.

*/
# Configure the AWS Provider
provider "aws" {
  # Configuration options
  shared_config_files      = ["../../../shared_config_files/conf"]
  shared_credentials_files = ["../../../shared_credentials_files/creds"]
  profile                  = "enterprise"
}

# 1- Create an IAM User 
resource "aws_iam_user" "localuser" {
  name = "dolfined_user"
  path = "/"
}

output "usr_arn" {
  value = aws_iam_user.localuser.arn
}

# 2- Create New Elastic IP
resource "aws_eip" "lb" {
  domain = "vpc"
}


# 3- Create New NAT gateway
resource "aws_nat_gateway" "example" {
  allocation_id = aws_eip.lb.id
  subnet_id     = "subnet-0001bad611a8f8169" 
  tags = {
    Name = "gw NAT"
  }
}

output "gw_id" {
  value = aws_nat_gateway.example.id
}
######### Commands #######: 
# terraform init
# terraform apply -auto-approve
# terraform destroy -auto-destroy
