variable "instance_type" {
  description = "The type of instance to use for the EC2 instance."
  type        = string
  default     = "m7i-flex.large"

}

variable "server_names" {
  description = "Tags for EC2 Instance"
  type        = set(string)
  default     = ["workstation", "github-runner", "infra-server"]
}

variable "number_of_instances" {
  type    = number
  default = 2
}

