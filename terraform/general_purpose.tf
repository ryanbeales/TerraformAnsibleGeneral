provider "aws" {
  region = "${var.region}"
}

resource "aws_instance" "general_purpose" {
  ami                         = "${lookup(var.ami, var.region)}"
  instance_type               = "${var.instance_type}"
  key_name                    = "${var.key_name}"
  associate_public_ip_address = true

  tags {
    Name            = "general_purpose"
    ansibleFilter   = "General01"
    ansibleNodeType = "general"
    ansibleNodeName = "general1"
  }

  vpc_security_group_ids = [
    "${aws_security_group.ssh_sg.id}",
  ]
}

resource "aws_security_group" "ssh_sg" {
  name        = "general_purpose_ssh"
  description = "Allow SSH to hosts"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8
    to_port     = 0
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_route53_record" "general" {
  zone_id = "${var.route53_zone_id}"
  name    = "${aws_instance.general_purpose.tags.ansibleNodeName}"
  type    = "A"
  ttl     = "300"
  records = ["${aws_instance.general_purpose.public_ip}"]
}
