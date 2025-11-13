output "instance_ip_addr" {
  value       = aws_instance.web.private_ip
  description = "The private IP address of the main web server instance."

  depends_on = [
    # Security group rule must be created before this IP address could
    # actually be used, otherwise the services will be unreachable.
    aws_security_group_rule.local_access,
  ]
}
output "db_endpoint" {
  value       = aws_db_instance.main.endpoint
  description = "The endpoint of the main database instance."
}