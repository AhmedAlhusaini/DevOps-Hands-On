# ## 🧾 Task Descriptions
# 
# ### **`task-01-bootstrap-infra-dev-cairo`**
# > Create an IAM user with programmatic access and permissions to provision EC2, VPCs, and subnets. This user will be used to execute all subsequent infrastructure tasks.
# 
# ---
# 
# ### **`task-02-create-vpc-subnet`**
# > Provision a new VPC and a public subnet using supported CIDR blocks. This sets up the foundational network layer for your environment.
# 
# ---
# 
# ### **`task-03-launch-public-ec2`**
# > Deploy a `t2.micro` EC2 instance inside the public subnet. Assign a tag `Name = "dolfined_instance"` and ensure the instance receives a public IP.
# 
# ---
# 
# ### **`task-04-validate-ec2-placement`**
# > Confirm that the EC2 instance is correctly placed within the newly created VPC and public subnet. This ensures proper network routing and accessibility.
# 
# ---
# 
# ### **`task-05-destroy-infra`**
# > Tear down all Terraform-managed infrastructure, including IAM, VPC, subnets, and EC2 instances. This cleans up your environment safely.
# 

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.20.0"
    }
  }
}

provider "aws" {
  # Configuration options
  shared_config_files      = ["../../../shared_config_files/conf"]
  shared_credentials_files = ["../../../shared_credentials_files/creds"]
  profile                  = "enterprise"
}
# To test the configuration, you can run the following command in your terminal:
	# AWS_CONFIG_FILE=./shared_config_files/conf \
	# AWS_SHARED_CREDENTIALS_FILE=./shared_credentials_files/creds \
	# aws sts get-caller-identity --profile enterprise --region us-west-2

resource "aws_iam_user" "infra_creator-dev-cairo" {
  name = "ahmed@infra-dev-cairo"
  path = "/"

  tags = {
    country = "cairo",
	environment="dev",
	team    = "infrastructure",
	Purpose = "InfrastructureProvisioning"
  }
}

resource "aws_iam_access_key" "infra_creator-dev-cairo" {
  user = aws_iam_user.infra_creator-dev-cairo.name
}

####Create IAM Group and attach policy to the group
resource "aws_iam_group" "infra_team" {
  name = "cairo-infra-team"
}

## Create IAM Policy Document
data "aws_iam_policy_document" "infra_creator-dev-cairo_policy" {
  statement {
    effect = "Allow"

    actions = [
      "ec2:RunInstances",
      "ec2:CreateTags",
      "ec2:DescribeInstances",
      "ec2:DescribeImages",
      "ec2:CreateSecurityGroup",
      "ec2:AuthorizeSecurityGroupIngress",
      "ec2:CreateSubnet",
      "ec2:CreateVpc",
      "ec2:DescribeVpcs",
      "ec2:DescribeSubnets",
      "ec2:DescribeSecurityGroups"
    ]

    resources = ["*"]
  }
}
## Attach the policy to the IAM Group
resource "aws_iam_group_policy" "infra_team_policy" {
  name   = "infra-team-policy"
  group  = aws_iam_group.infra_team.name
  policy = data.aws_iam_policy_document.infra_creator-dev-cairo_policy.json
}

# Add the user to the group
resource "aws_iam_user_group_membership" "infra_creator-dev-cairo_membership" {
  user = aws_iam_user.infra_creator-dev-cairo.name
  groups = [
	aws_iam_group.infra_team.name
  ]
}

# Output the access key and secret key
output "infra_creator-dev-cairo_access_key_id" {
  value = aws_iam_access_key.infra_creator-dev-cairo.id
  sensitive = true
}

output "infra_creator-dev-cairo_secret_access_key" {
  value = aws_iam_access_key.infra_creator-dev-cairo.secret
  sensitive = true
}
#terraform output -json
#terraform output infra_creator-dev-cairo_access_key_id
#terraform output infra_creator-dev-cairo_secret_access_key



resource "aws_vpc" "enterprise_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "enterprise"
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.enterprise_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"

  tags = {
    Name = "enterprise-public-subnet"
  }
}
resource "aws_subnet" "private" {
  vpc_id                  = aws_vpc.enterprise_vpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = false
  availability_zone       = "us-east-1b"

  tags = {
    Name = "enterprise-private-subnet"
  }
}


resource "aws_instance" "instance_public" {
  ami                         = "ami-0157af9aea2eef346" #data.aws_ami.amazon_linux.id
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public.id
  associate_public_ip_address = true

  tags = {
    Name = "public_instance"
  }
}
resource "aws_instance" "instance_private" {
  ami                         = "ami-0157af9aea2eef346" #data.aws_ami.amazon_linux.id
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.private.id
  associate_public_ip_address = false

  tags = {
	Name = "private_instance"
  }
}