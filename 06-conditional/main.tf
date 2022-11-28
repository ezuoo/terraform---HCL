provider "aws" {
    region = "ap-northeast-2"
}

variable "is_john" {
  type = bool
  default = true
}

locals {
  message = var.is_john ? "Hello John !" : "Hello !"
}

output "message" {
  value = local.message
}

variable "internet_gateway_enabled" {
  type = bool
  default = true
}

resource "aws_vpc" "test_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_internet_gateway" "test_internet_gateway" {
  count = var.internet_gateway_enabled  ? 1 : 0
  vpc_id = aws_vpc.test_vpc.id
}