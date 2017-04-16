variable "region" {
  description = "The AWS region ID"
}

variable "ami" {
  type = "map"

  default = {
    us-east-1 = "ami-0d729a60"
    us-west-1 = "ami-7c4b331c"
    eu-west-2 = "ami-11130775"
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
