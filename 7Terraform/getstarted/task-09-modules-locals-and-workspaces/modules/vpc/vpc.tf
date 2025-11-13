resource "aws_vpc" "newvpc" {
  cidr_block = "10.0.0.0/16"
}

output "vpc_alhusainy_id" {
  value = aws_vpc.newvpc.id
}
