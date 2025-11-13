resource "aws_security_group" "appSG" {
  name = "myapp-sg"
  description="myapp-sg"

  ingress {
    description = "Allow Inbound from My Database Application "
    from_port   = local.app_port
    to_port     = local.app_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = var.egress-alhusainy-ports[0]
    to_port     = var.egress-alhusainy-ports[1]
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

locals {
  app_port = "6000"
}
output "sgid" {
  value = aws_security_group.appSG.id
}

