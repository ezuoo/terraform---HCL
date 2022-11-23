provider "aws" {
  region = "ap-northeast-2"
}

resource "aws_vpc" "default-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "fastcampus-default-vpc"
  }
}

resource "aws_subnet" "default-vpc-public-subnet" {
  vpc_id     = aws_vpc.default-vpc.id
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "fastcampus-default-vpc-public-subnet"
  }
}

resource "aws_subnet" "default-vpc-private-subnet" {
  vpc_id     = aws_vpc.default-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "fastcampus-default-vpc-private-subnet"
  }
}