provider "aws" {
  region = "ap-northeast-2"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

locals {
  vpc_name = "default"
  common_tags = {
    "Project" = "provisioner-userdata"
  }
}

resource "aws_default_vpc" "default" {
  tags = {
    Name = local.vpc_name
  }
}

module "security_group" {
  source  = "tedilabs/network/aws//modules/security-group"
  version = "0.26.1"

  name        = "${local.vpc_name}-provisioner-userdata"
  description = "Security Group for test."
  vpc_id      = aws_default_vpc.default.id

  ingress_rules = [
    {
      id          = "ssh"
      protocol    = "tcp"
      from_port   = 22
      to_port     = 22
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow SSH from anywhere."
    },
    {
      id          = "http"
      protocol    = "tcp"
      from_port   = 80
      to_port     = 80
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow HTTP from anywhere."
    },
  ]

  egress_rules = [
    {
      id          = "all/all"
      description = "Allow to communicate to the Internet."
      protocol    = "-1"
      from_port   = 0
      to_port     = 0

      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  tags = local.common_tags
}

###################################################
# Userdata
###################################################
resource "aws_instance" "userdata" {
  ami           = data.aws_ami.ubuntu.image_id
  instance_type = "t2.micro"
  key_name      = "fastcampus"

  user_data = <<EOT
  #!/bin/bash
  sudo apt-get update
  sudo apt-get install -y nginx
EOT

  vpc_security_group_ids = [
    module.security_group.id
  ]

  tags = {
    Name = "fastcampush-userdata"
  }
}

###################################################
# Provisioner - in EC2
###################################################
resource "aws_instance" "provisioner" {
  ami           = data.aws_ami.ubuntu.image_id
  instance_type = "t2.micro"
  key_name      = "fastcampus"

  vpc_security_group_ids = [
    module.security_group.id,
  ]

  tags = {
    Name = "fastcampus-provisioner"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y nginx",
    ]

    connection {
      type = "ssh"
      user = "ubuntu"
      host = self.public_ip
    }
  }
}