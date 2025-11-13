#create two instances and using new subnet and new vpc and the other one will be in the default vpc
module "myvpc" {
  source = "../../modules/vpc"
}
module "mysg" {
  source = "../../modules/sg"
  egress-alhusainy-ports = [5,5]
}
resource "aws_subnet" "newsubnet" {
  vpc_id     = module.myvpc.vpc_alhusainy_id
  cidr_block = "10.0.1.0/24"
}
resource "aws_instance" "web" {
  ami           = "ami-03f38e546e3dc59e1"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.newsubnet.id

}

resource "aws_instance" "app" {
  ami                    = "ami-03f38e546e3dc59e1"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [module.mysg.sgid]
}


# From Register : 

# module "ec2-instance" {
#   source        = "terraform-aws-modules/ec2-instance/aws"
#   version       = "5.2.0"
#   ami           = "ami-06b09bfacae1453cb"
#   instance_type = "t2.micro"
# }
