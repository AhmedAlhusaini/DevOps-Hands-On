# variable "app_port" {
#   # default = "8080"
# }

variable "egress-alhusainy-ports" {
  type=list(number)
  description = "Ay 7aga kol 7aga"
  default = [ 0,0 ]
}