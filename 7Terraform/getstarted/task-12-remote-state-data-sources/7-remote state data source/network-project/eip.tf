resource "aws_eip" "lb" {
  vpc = true
}

output "AllocationID" {
  value = aws_eip.lb.allocation_id
}
output "eip_addr" {
  value = aws_eip.lb.public_ip
}
