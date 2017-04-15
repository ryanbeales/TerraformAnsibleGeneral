## Create a general purpose host in AWS with Terraform and Ansible

Use Terraform to create:
	- An EC2 instance
	- A security group to allow SSH
	- A Route53 domain entry for the host
	- Save outputs in output.json for use with Ansible

Use Ansible to:
	- Set the hostname of the new instance
	- Install required packages
	- Create user, apply public key, and add to sudoers
