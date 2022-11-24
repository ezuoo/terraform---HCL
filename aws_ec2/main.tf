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

resource "aws_instance" "default-ubuntu-ec2" {
  ami           = data.aws_ami.ubuntu.image_id
  instance_type = "t2.micro"

  tags = {
    Name = "default-ubuntu-ec2"
  }
}

data "aws_instance" "default-ubuntu-ec2" {
  instance_id = aws_instance.default-ubuntu-ec2.id
}

output "default-ubuntu-ec2-info" {
  value = data.aws_instance.default-ubuntu-ec2
}