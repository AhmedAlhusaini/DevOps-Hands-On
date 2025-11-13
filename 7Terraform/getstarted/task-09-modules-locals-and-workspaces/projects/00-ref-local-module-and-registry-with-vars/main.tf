
module "ec2module" {
  source       = "../../modules/ec2"
  # Even Given Value - It will not overwrite - coz locals
  # Here if we put value with var in module - it will get the value from variables file if not given blow , else given value here will be override in variables 
  # if not declared with var , and we add " #instance_type = "t2.meduim"" this will override value that exist in variables
  prod_ec2_instance="t2.large"
  prd_instance_count=10
  
}

#From Registry 

# module "ec2-instance" {
#   source        = "terraform-aws-modules/ec2-instance/aws"
#   version       = "5.2.0"
#   ami           = "ami-06b09bfacae1453cb"
#   instance_type = "t2.micro"
# }


