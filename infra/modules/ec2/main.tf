data "aws_ami" "ubuntu" {

  most_recent = true

  owners = ["099720109477"] # Canonical
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}



resource "aws_instance" "workstation" {
  count                  = var.number_of_instances
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  security_groups        = ["launch-wizard-1"]
  vpc_security_group_ids = ["sg-026fc3b771fecac78"]
  key_name               = var.key_name
  root_block_device {
    volume_size = 29
    volume_type = "gp3"
  }
  tags = {
    Name = var.name
  }


  provisioner "remote-exec" {
    when = create
    inline = var.name == "github-runner" ? [
      "sudo apt-get update -y",
      "sudo apt-get install -y docker.io git",
      "sudo usermod -aG docker ubuntu",
      "newgrp docker",
      "sudo systemctl enable docker",
      "sudo systemctl start docker",
      "sudo apt-get install -y npm",
      "sudo apt-get install -y nodejs",
      "sudo apt-get update && sudo apt-get install -y wget gnupg lsb-release",
      "wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | gpg --dearmor | sudo tee /usr/share/keyrings/trivy.gpg > /dev/null",
      "echo \"deb [signed-by=/usr/share/keyrings/trivy.gpg] https://aquasecurity.github.io/trivy-repo/deb generic main\" | sudo tee -a /etc/apt/sources.list.d/trivy.list",
      "sudo apt-get update && sudo apt-get install trivy -y"
    
    ] : []

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file(var.private_key_path)
      host        = self.public_ip
    }
  }

  
}
