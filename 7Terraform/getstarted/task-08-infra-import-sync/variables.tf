variable "ec2_instance_type" {
  description = "Type of EC2 instance"
  type        = string
  #default     = "t2.micro"
}


variable "east_ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
  #default = "ami-0157af9aea2eef346"
}
variable "west_ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
  #default = "ami-0157af9aea2eef346"
}
