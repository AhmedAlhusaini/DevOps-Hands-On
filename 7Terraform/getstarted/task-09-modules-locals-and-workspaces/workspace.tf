resource "aws_instance" "myec2" {
  ami           = "ami-06b09bfacae1453cb"
  instance_type = lookup(var.type, terraform.workspace)
  key_name      = lookup(var.key_name, terraform.workspace)
  tags = {
    Name = lookup(var.tag_name, terraform.workspace)
  }
}