variable "region" {
  description = "The AWS region ID"
}

variable "ami" {
  type = map(string)

  default = {
    us-east-1 = "ami-0323c3dd2da7fb37d"
    us-west-1 = "ami-06fcc1f0bc2c8943f"
    us-west-2 = "ami-0d6621c01e8c2de2c"
    eu-west-2 = "ami-01a6e31ac994bbc09"
  }

  description = "Default image to use in each region"
}

variable "instance_type" {
  description = "Instance type"
  default     = "t2.micro"
}

variable "key_name" {
  description = "The AWS key pair name to use for the resources"
}

variable "key_path" {
  description = "AWS EU west 2 key path"
  default = ""
}

variable "route53_zone_id" {
  description = "Zone ID to add the public ip of the host to"
}

variable "hostname" {
  description = "The host name that will be regiered with route53, and eventually set with ansible"
}
