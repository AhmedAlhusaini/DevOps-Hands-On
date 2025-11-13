
# Example-1
# data "aws_ami" "myami" {
#   most_recent = true
#   owners      = ["amazon"]


#   filter {
#     name   = "name"
#     values = ["amzn2-ami-hvm*"]
#   }
# }

# output "fetched_ami" {
#   value = data.aws_ami.myami.id

# }

# resource "aws_instance" "myec2" {
#   ami           = data.aws_ami.myami.id
#   instance_type = "t2.micro"
# }

############################################
# Example-2
#Retrieve the list of AZs in the current AWS region
data "aws_availability_zones" "available" {}
data "aws_region" "current" {}

output "available_zones" {
  value = data.aws_availability_zones.available.names[*]
}
output "current_region" {
  value = data.aws_region.current.id
}
