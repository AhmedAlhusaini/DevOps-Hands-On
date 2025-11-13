
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