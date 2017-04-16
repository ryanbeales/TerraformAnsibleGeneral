## Create a general purpose host in AWS with Terraform and Ansible

Use Terraform to create:
- An EC2 instance
- A security group to allow SSH from anywhere
- A Route53 domain entry for the host
- Save outputs in output.json for use with Ansible

Use Ansible to:
- Set the hostname of the new instance
- Install required packages
- Create the current local user, apply public key, and add to sudoers on the remote host

Requirements:
- To install ansible, terraform, and python packages aws and boto
- Ansible and Terraform are in the path
- An AWS access_key and secret key, configured in the aws package
- An ssh key-pair, already added to this users ssh (the current user needs to ssh to ec2-user)

There are multiple ways to complete all the above requirements.

To create your host:
- Edit the ./terraform/terraform.tfvars file with your variables
- Run `./terraform/create_inventory.sh`, this also creates the output.json
- Run `./ansible/apply_configuration.sh`

After the above steps have run you will be able to ssh as the current user to the newly created remote host:
```
ssh {hostname from terraform.tfvars}.{route53 domain name}
```
