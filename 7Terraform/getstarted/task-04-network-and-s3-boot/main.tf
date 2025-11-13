/*
🛠️ Task Steps
1. Configure AWS Provider
Use terraform_dev profile and us-east-1 region.

2. Fetch Dynamic AWS Data
Availability zones (data.aws_availability_zones)

Current region (data.aws_region)

3. Create VPC
CIDR block from var.vpc_cidr

Tagged with environment and Terraform ownership

4. Deploy Subnets
Private Subnets: looped via for_each, spread across AZs

Public Subnets: looped via for_each, with public IP mapping

5. Create Route Tables
Public route table with IGW route

Private route table (currently also routed to IGW — adjust for NAT in real use)

6. Associate Subnets with Route Tables
Use for_each and depends_on for clean dependency resolution

7. Create Internet Gateway
Attached to the VPC

Enables outbound traffic for public subnets

8. Generate Random ID
Used to create globally unique S3 bucket name

9. Create S3 Bucket
Named dolfinedtestbucket${random_id.randomness.hex}

Tagged for purpose and visibility

10. Create Security Group
Allows inbound HTTPS (TCP 443) from anywhere

Tagged for purpose and lab context

*/


# Configure the AWS Provider
provider "aws" {
  shared_config_files      = ["../../../shared_config_files/conf"]
  shared_credentials_files = ["../../../shared_credentials_files/creds"]
  profile                  = "enterprise"
}

#Retrieve the list of AZs in the current AWS region
data "aws_availability_zones" "available" {}
data "aws_region" "current" {}

#Define the VPC 
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name        = var.vpc_name
    Environment = "demo_environment"
    Terraform   = "true"
  }
}

#Deploy the private subnets
resource "aws_subnet" "private_subnets" {
  for_each          = var.private_subnets
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, each.value)
  availability_zone = tolist(data.aws_availability_zones.available.names)[each.value]

  tags = {
    Name      = each.key
    Terraform = "true"
  }
}

#Deploy the public subnets
resource "aws_subnet" "public_subnets" {
  for_each                = var.public_subnets
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = cidrsubnet(var.vpc_cidr, 8, each.value + 100)
  availability_zone       = tolist(data.aws_availability_zones.available.names)[each.value]
  map_public_ip_on_launch = true

  tags = {
    Name      = each.key
    Terraform = "true"
  }
}

#Create route tables for public and private subnets
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }
  tags = {
    Name      = "demo_public_rtb"
    Terraform = "true"
  }
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }
  tags = {
    Name      = "demo_large_dolfined_infra"
    Terraform = "true"
  }
}

#Create route table associations
resource "aws_route_table_association" "public" {
  depends_on     = [aws_subnet.public_subnets]
  route_table_id = aws_route_table.public_route_table.id
  for_each       = aws_subnet.public_subnets
  subnet_id      = each.value.id
}

resource "aws_route_table_association" "private" {
  depends_on     = [aws_subnet.private_subnets]
  route_table_id = aws_route_table.private_route_table.id
  for_each       = aws_subnet.private_subnets
  subnet_id      = each.value.id
}

#Create Internet Gateway
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "demo_igw"
  }
}

#Create random ids to be used by S3 Bucket names.
resource "random_id" "randomness" {
  byte_length = 16
}

#Create newS3 Bucket resource.
resource "aws_s3_bucket" "my-new-S3-bucket" {
  bucket = "dolfinedtestbucket${random_id.randomness.hex}"
  tags = {
    Name    = "dolfined_test"
    Purpose = "for testing purpose"
  }
}

#Create security group resource
resource "aws_security_group" "my-new-security-group" {
  name        = "web_server_inbound"
  description = "Allow inbound traffic on tcp/443"
  vpc_id      = aws_vpc.vpc.id
  ingress {
    description = "Allow 443 from the Internet"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name    = "web_server_inbound"
    Purpose = "Intro to Resource Blocks Lab"
  }
}
