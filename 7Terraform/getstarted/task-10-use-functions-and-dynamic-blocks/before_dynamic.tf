# before using Dynamic blocks
# provider "aws" {
#   region  = "us-east-2"
#   profile = "dev_admin"
# }
# resource "aws_security_group" "public_sg" {
#   name        = "public_sg"
#   description = "for allowing access to internet"
#   vpc_id      = "vpc-02c2fbf1e4c85a09c"

#   ingress {
#     from_port   = 8200
#     to_port     = 8200
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   ingress {
#     from_port   = 4200
#     to_port     = 4200
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   ingress {
#     from_port   = 5000
#     to_port     = 5000
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   ingress {
#     from_port   = 9500
#     to_port     = 9500
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   egress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   egress {
#     from_port   = 8080
#     to_port     = 8080
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   egress {
#     from_port   = 443
#     to_port     = 443
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }


########################################################################
# after using Dynamic Blocks
provider "aws" {
  region  = "us-east-2"
  profile = "terraform_dev"
}
variable "internal_ports" {
  default = [8200, 4200, 5000, 9500]
}
variable "external_ports" {
  default = [80, 8080, 443]
}
resource "aws_security_group" "public_sg" {
  name        = "public_sg"
  description = "for allowing access to internet"
  vpc_id      = "vpc-02c2fbf1e4c85a09c"
  dynamic "ingress" {
    for_each = var.internal_ports
    iterator = internal_ports
    content {
      from_port   = internal_ports.value
      to_port     = internal_ports.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  dynamic "egress" {
    for_each = var.external_ports
    iterator = external_ports
    content {
      from_port   = external_ports.value
      to_port     = external_ports.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}
