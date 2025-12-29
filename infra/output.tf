
output "ip_addr" {
  value = {
    for k, m in module.servers : k => m.ip_addr

  }
}
output "key_name" {
  value = data.aws_key_pair.key.key_name
}

output "server_name" {
  value = {
    for k, m in module.servers : k => m.server_name
  }
}

output "dns" {
  value = {

    for k, m in module.servers : k => m.dns_name
  }
}
