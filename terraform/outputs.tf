output "address" {
  value = aws_instance.general_purpose.public_ip
}

output "fqdn" {
  value = aws_route53_record.general.fqdn
}
