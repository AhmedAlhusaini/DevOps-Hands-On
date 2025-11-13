resource "aws_instance" "myec2" {
  ami           = "ami-06b09bfacae1453cb"
  instance_type = lookup(var.type, terraform.workspace)
  key_name      = lookup(var.key_name, terraform.workspace)
  tags = {
    Name = lookup(var.tag_name, terraform.workspace)
  }
}
variable "type" {
  type = map(any)
  default = {
    default = "t2.micro"
    prod    = "t2.large"
    dev     = "t2.medium"
    stage   = "t3.medium"
  }
}

variable "key_name" {
  type = map(any)
  default = {
    default = "MyKey"
    prod    = "prod_key"
    dev     = "dev_key"
    stage   = "staging_key"
  }
}

variable "tag_name" {
  type = map(any)
  default = {
    default = "default_instance"
    prod    = "prod_instance"
    dev     = "dev_instance"
    stage   = "staging_instance"
  }
}
