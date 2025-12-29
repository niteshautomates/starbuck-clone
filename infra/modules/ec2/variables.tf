variable "instance_type" {
  description = "The type of instance to use for the EC2 instance."
  type        = string
   
}

variable "name" {
  description = "Tags for EC2 Instance"
  type = string
}

variable "number_of_instances" {
  type = number
  default = 1
}

variable "key_name" {
  type = string
}

variable "private_key_path" {
  default = "/Users/niteshwayafalkar/Downloads/ssh_key.pem"
}