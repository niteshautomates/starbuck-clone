output "ubuntu_name" {
  value = data.aws_ami.ubuntu.name
}

output "ip_addr" {
  value = aws_instance.workstation[*].public_ip
}

output "key_name" {
  value = aws_instance.workstation[*].key_name
}

output "server_name" {
  value = aws_instance.workstation[*].tags["Name"]
}

output "dns_name" {
  value = aws_instance.workstation[*].public_dns
}