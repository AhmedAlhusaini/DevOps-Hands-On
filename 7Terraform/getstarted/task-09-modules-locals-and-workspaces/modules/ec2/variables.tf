# variable "dev_ec2_instance" {
#   #default = "t2.micro"
# }
variable "prod_ec2_instance" {
  default = "t2.micro"
}
variable "prd_instance_count" {
  type = number
  description = "Instance Count"
  default = 0
}
