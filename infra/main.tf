data "aws_key_pair" "key" {
  key_name           = "ssh_key"
  include_public_key = true

}

module "servers" {

  for_each      = var.server_names
  source        = "./modules/ec2"
  instance_type = var.instance_type
  #count         = var.number_of_instances
  key_name = data.aws_key_pair.key.key_name
  name     = each.value
}
