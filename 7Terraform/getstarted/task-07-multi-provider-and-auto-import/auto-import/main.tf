import {
  to = aws_instance.web_server
  id = "i-0e98a68ae59317d66"
}

# Output Config --> 
	# terraform plan -h  
	# terraform plan -out=tfplan
	# terraform apply "tfplan" 
	


	# terraform plan  -generate-config-out=./hello-imported-ec2.tfplan
	#terraform plan -out=hello-imported-ec2.tfplan
	#terraform apply ./hello-imported-ec2.tfplan

# terraform import aws_instance.web_server i-0e98a68ae59317d66