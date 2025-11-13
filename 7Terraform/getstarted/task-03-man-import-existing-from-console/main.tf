/*
Convert a manually created EC2 instance into Terraform-managed infrastructure, 
verify its state, and prepare for modular scaling.

Step 1: Identify the Target Resource
	Go to AWS Console → EC2 → Instances
	Choose one instance (e.g., i-0abc123def456gh78)
	Note down:
		Instance ID
		Region
		Tags
		Security Group
		Key Pair
		AMI ID
		Subnet/VPC

*/

# Configure the AWS Provider
provider "aws" {
  # Configuration options
  shared_config_files      = ["../../../shared_config_files/conf"]
  shared_credentials_files = ["../../../shared_credentials_files/creds"]
  profile                  = "enterprise"
}

# Step 2: Import the EC2 Instance into Terraform State
# Replace "i-0abc123def456gh78" with your actual Instance ID
resource "aws_instance" "imported_instance" {
  # The resource block is intentionally left empty for import
  # Configuration will be populated after import
  ami                                  = "ami-0f9c27b471bdcd702"
  associate_public_ip_address          = true
  availability_zone                    = "us-east-1c"
  instance_type                        = "t3.micro"
  subnet_id                           = "subnet-0c621079ec0e1a88c"
  key_name                           = ""
tags = {
    Name = "legacy-imported"
  }
}


# Import Command (to be run in terminal):
# terraform import aws_instance.imported_instance i-0638039aece1fdc02

# Step 3: Define the EC2 Instance Configuration
/*
terraform init
terraform import aws_instance.imported_instance i-0638039aece1fdc02
	
*/
# After import, populate the resource block with actual configuration

#step 4: Verify the State
# Run the following command to verify the state
# terraform state show aws_instance.imported_instance >>imported_instance.tf
# This will output the current state of the imported instance into a file named imported_instance.tf
#Then you can update or populate what props inside your main block 

/*

# aws_instance.imported_instance:
resource "aws_instance" "imported_instance" {
    ami                                  = "ami-0157af9aea2eef346"
    arn                                  = "arn:aws:ec2:us-east-1:718170779365:instance/i-0638039aece1fdc02"
    associate_public_ip_address          = true
    availability_zone                    = "us-east-1c"
    disable_api_stop                     = false
    disable_api_termination              = false
    ebs_optimized                        = false
    force_destroy                        = false
    get_password_data                    = false
    hibernation                          = false
    host_id                              = [90mnull[0m[0m
    iam_instance_profile                 = [90mnull[0m[0m
    id                                   = "i-0638039aece1fdc02"
    instance_initiated_shutdown_behavior = "stop"
    instance_lifecycle                   = [90mnull[0m[0m
    instance_state                       = "running"
    instance_type                        = "t2.nano"
    ipv6_address_count                   = 0
    ipv6_addresses                       = []
    key_name                             = [90mnull[0m[0m
    monitoring                           = false
    outpost_arn                          = [90mnull[0m[0m
    password_data                        = [90mnull[0m[0m
    placement_group                      = [90mnull[0m[0m
    placement_group_id                   = [90mnull[0m[0m
    placement_partition_number           = 0
    primary_network_interface_id         = "eni-035c7f072f56dedd7"
    private_dns                          = "ip-172-31-28-235.ec2.internal"
    private_ip                           = "172.31.28.235"
    public_dns                           = "ec2-54-174-214-181.compute-1.amazonaws.com"
    public_ip                            = "54.174.214.181"
    region                               = "us-east-1"
    secondary_private_ips                = []
    security_groups                      = [
        "default",
    ]
    source_dest_check                    = true
    spot_instance_request_id             = [90mnull[0m[0m
    subnet_id                            = "subnet-0c621079ec0e1a88c"
    tags                                 = {
        "Name" = "import-into-tf"
    }
    tags_all                             = {
        "Name" = "import-into-tf"
    }
    tenancy                              = "default"
    vpc_security_group_ids               = [
        "sg-0d85438e9556c75dc",
    ]

    capacity_reservation_specification {
        capacity_reservation_preference = "open"
    }

    cpu_options {
        amd_sev_snp      = [90mnull[0m[0m
        core_count       = 1
        threads_per_core = 1
    }

    credit_specification {
        cpu_credits = "standard"
    }

    enclave_options {
        enabled = false
    }

    maintenance_options {
        auto_recovery = "default"
    }

    metadata_options {
        http_endpoint               = "enabled"
        http_protocol_ipv6          = "disabled"
        http_put_response_hop_limit = 2
        http_tokens                 = "required"
        instance_metadata_tags      = "disabled"
    }

    primary_network_interface {
        delete_on_termination = true
        network_interface_id  = "eni-035c7f072f56dedd7"
    }

    private_dns_name_options {
        enable_resource_name_dns_a_record    = true
        enable_resource_name_dns_aaaa_record = false
        hostname_type                        = "ip-name"
    }

    root_block_device {
        delete_on_termination = true
        device_name           = "/dev/xvda"
        encrypted             = false
        iops                  = 3000
        kms_key_id            = [90mnull[0m[0m
        tags                  = {}
        tags_all              = {}
        throughput            = 125
        volume_id             = "vol-05e601bcd3b35ec0a"
        volume_size           = 8
        volume_type           = "gp3"
    }
}


*/


# Step 5: Prepare for Modular Scaling
# Create a module for EC2 instances (not shown here)
# This module can be reused to launch multiple instances with similar configurations

/*
resource "aws_instance" "imported_instance" {
  ami           = "ami-0xyz123abc456def7"
  instance_type = "t2.micro"
  subnet_id     = "subnet-0abc123def456gh7"
  key_name      = "my-keypair"
  tags = {
    Name = "legacy-imported"
  }
}
*/


#step 6: you can change or update and push back these changes into tfstate <-> console 


#step 7: Get State List & Depencies 
	# terraform state list
	# terraform providers
	# terraform graph

# Step 8: Bouns 
/* 

Bonus: Drift Detection and Automation
Use terraform plan regularly to detect drift

Consider tools like:
	Terraformer: auto-generate .tf from existing infra
	Infracost: estimate cost impact of changes
	Atlantis or Terragrunt for team workflows
*/

# step 9 : How to aviod desctroying imported resource by mistake
/*
How to Avoid Destruction (Preserve the Instance)
If your goal is to test Terraform control without destroying anything, follow this strategy:

Keep Immutable Fields As-Is
Don’t change:

	ami
	associate_public_ip_address
	subnet_id
	ebs_block_device
	root_block_device

Instead, test with safe changes like:

	tags
	key_name
	user_data
	monitoring
	iam_instance_profile
*/

# step 9: Cleanup
# terraform destroy