resource "aws_key_pair" "deployer" {
  key_name   = "ec2_key"
  public_key = file("./ec2_key.pub")
}
resource "aws_instance" "myec2" {
  ami           = "ami-022e1a32d3f742bd8"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.deployer.key_name
  associate_public_ip_address = true
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("./ec2_key")
    host        = self.public_ip
  }
provisioner "local-exec" {
  # Wait for 30 seconds to allow the instance to be ready for SSH connections
  # Output the public IP address of the instance
   command     = "sleep 10 && echo ${self.public_ip} >> ip_address_public.txt && echo ${self.private_ip} >> private_ips.txt"

}
  provisioner "remote-exec" {
    inline = [
      "sudo yum -y install nginx",
      "sudo systemctl start nginx"
    ]
  }
  tags = {
    Name = "myec2-instance"
  }
}

# Remeber : Check the ip_address_public.txt file for public IP of the instance to access nginx server
# Update Manuully the security group to allow HTTP access on port 80 to access nginx server & SSH on port 22
# Or Create it via terraform code itself in same file or different file and attach it to the instance