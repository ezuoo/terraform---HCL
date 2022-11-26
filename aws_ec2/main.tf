provider "aws" {
  region = "ap-northeast-2"
}

# Get ubuntu image infomation
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

  owners = ["099720109477"] # Canonical
}

data "aws_vpc" "default-vpc" {
  filter {
    name   = "tag:Name"
    values = ["default-vpc"]
  }
}

data "aws_subnet" "public_subnet" {
  filter {
    name   = "tag:Name"
    values = ["default-vpc-public-subnet"]
  }
}

# Creating aws sg for ec2
resource "aws_security_group" "ubuntu-ec2-sg" {
  name        = "ubuntu-ec2-sg"
  description = "ubuntu-ec2-sg"
  vpc_id      = data.aws_vpc.default-vpc.id

  tags = {
    Name = "ubuntu-ec2-sg"
  }
}

resource "aws_security_group_rule" "ubuntu-ec2-sg-inbound-ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ubuntu-ec2-sg.id
}

resource "aws_security_group_rule" "ubuntu-ec2-sg-inbound-http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ubuntu-ec2-sg.id
}

resource "aws_security_group_rule" "ubuntu-ec2-sg-inbound-https" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ubuntu-ec2-sg.id
}

resource "aws_security_group_rule" "ubuntu-ec2-sg-outbound" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ubuntu-ec2-sg.id
}

resource "aws_network_interface" "ubuntu-ec2-ni" {
  subnet_id       = data.aws_subnet.public_subnet.id
  security_groups = [aws_security_group.ubuntu-ec2-sg.id]
}
resource "aws_instance" "ubuntu-ec2" {
  ami = data.aws_ami.ubuntu.image_id

  key_name               = "fastcampus"
  instance_type          = "t2.micro"
  network_interface {
    network_interface_id = aws_network_interface.ubuntu-ec2-ni.id
    device_index         = 0
  }

  tags = {
    Name = "ubuntu-ec2"
  }
}

# data "aws_instance" "default-ubuntu-ec2"{
#   instance_id = "i-0d6f14a0f9e7ff060"
# }
# output "default-ubuntu-ec2-info" {
#   value = data.aws_instance.default-ubuntu-ec2
# }

# data "aws_instance" "test-ubuntu-ec2"{
#   instance_id = "i-0338998ac6f29d7eb"
# }

# output "test-ubuntu-ec2-info" {
#   value = data.aws_instance.test-ubuntu-ec2
# }

