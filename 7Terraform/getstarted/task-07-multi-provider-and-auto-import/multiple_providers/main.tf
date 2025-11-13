provider "aws" {
  region  = "us-east-1"
  profile = "terraform_dev"
}

provider "aws" {
  alias   = "non_default"
  region  = "us-east-2"
  profile = "terraform_dev2"
}

resource "aws_instance" "instance1" {
  ami           = "ami-0f1a6835595fb9246"
  instance_type = "t2.micro"
  tags = {
    Name = "us_east_1_instance"
  }
}

resource "aws_instance" "instance2" {
  provider      = aws.non_default
  ami           = "ami-0030e9fc5c777545a"
  instance_type = "t2.micro"
  tags = {
    Name = "us_east_2_instance"
  }
}
