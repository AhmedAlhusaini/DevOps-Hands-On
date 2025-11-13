
variable "type" {
  type = map(any)
  default = {
    default = "t2.micro"
    prod    = "t2.large"
    dev     = "t2.medium"
    stage   = "t3.medium"
  }
}

variable "key_name" {
  type = map(any)
  default = {
    default = "MyKey"
    prod    = "prod_key"
    dev     = "dev_key"
    stage   = "staging_key"
  }
}

variable "tag_name" {
  type = map(any)
  default = {
    default = "default_instance"
    prod    = "prod_instance"
    dev     = "dev_instance"
    stage   = "staging_instance"
  }
}
