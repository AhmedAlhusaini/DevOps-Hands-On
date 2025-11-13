# Example of Local-Exec Provisioner
# resource "aws_instance" "myec2" {
#   ami           = "ami-0dfcb1ef8550277af"
#   instance_type = "t2.micro"
#   provisioner "local-exec" {
#     command = "echo ${aws_instance.myec2.private_ip} >> private_ips.txt"
#   }
# }

########################################################
# Example of Creation-time Provisioner
# resource "aws_instance" "myec2" {
#   ami           = "ami-0dfcb1ef8550277af"
#   instance_type = "t2.micro"
#   provisioner "local-exec" {
#     command    = "echo ${aws_instance.myec2.private_ip} >>> private_ips.txt"
#     on_failure = continue
#   }
# }
###########################################################
# Example of Destroy-time Provisioner
resource "aws_instance" "myec2" {
  ami           = "ami-0dfcb1ef8550277af"
  instance_type = "t2.micro"
  provisioner "local-exec" {
    command = "echo 'my instance will be destroyed'"
    when    = destroy
  }
}
