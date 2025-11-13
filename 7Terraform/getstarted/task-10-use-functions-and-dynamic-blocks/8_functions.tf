
# functions used in this example file, lookup,element,formatdate,timestamp
/*
> lookup({a="ay", b="bee"}, "a", "what?")
ay
> lookup({a="ay", b="bee"}, "c", "what?")
what?
> element(["a", "b", "c"], 1)
b
> file("${path.module}/hello.txt")
Hello World
> timestamp()
2018-05-13T07:44:12Z
> formatdate("DD MMM YYYY hh:mm ZZZ", "2018-01-02T23:12:01Z")
02 Jan 2018 23:12 UTC
*/
provider "aws" {
  region  = "us-east-1"
  profile = "terraform_dev"
}

locals {
  time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
}

variable "region" {
  default = "us-east-1"
}

variable "tags" {
  type    = list(any)
  default = ["firstec2", "secondec2"]
}

variable "ami" {
  type = map(any)
  default = {
    "us-east-1"  = "ami-06b09bfacae1453cb"
    "us-west-2"  = "ami-02d8bad0a1da4b6fd"
    "ap-south-1" = "ami-0b9ecf71fe947bbdd"
  }
}

resource "aws_key_pair" "terraform_key" {
  key_name   = "terraform_key"
  public_key = file("${path.module}/id_rsa.pub")
}

resource "aws_instance" "app-dev" {
  ami           = lookup(var.ami, var.region, "please enter one of the following regions : us-east-1,us-west-2,ap-south-1")
  instance_type = "t2.micro"
  key_name      = "terraform_key"
  count         = 2

  tags = {
    Name = element(var.tags, count.index)
  }
}


output "timestamp" {
  value = local.time
}
