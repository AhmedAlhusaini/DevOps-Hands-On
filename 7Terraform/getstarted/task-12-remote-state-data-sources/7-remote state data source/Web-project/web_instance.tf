resource "aws_instance" "webapp" {
  ami           = "ami-0103f211a154d64a6"
  instance_type = "t2.micro"
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.webapp.id
  allocation_id = data.terraform_remote_state.eip.outputs.AllocationID
}
