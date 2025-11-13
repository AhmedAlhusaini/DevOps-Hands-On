variable "phone_number" {
  type = string
  # default   = "1234-5678"
  sensitive = true
}
output "phone_number" {
  value     = var.phone_number
  sensitive = true
}

variable "app_password" {
  type = string
  # default   = "secret12345"
  sensitive = true
}

output "myapp_password" {
  value     = var.app_password
  sensitive = true
}
