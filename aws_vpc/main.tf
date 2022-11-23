provider "aws" {
  region = "ap-northeast-2"
}

# Creating aws vpc
resource "aws_vpc" "default-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "fastcampus-default-vpc"
  }
}

# Creating aws vpc public subnet
resource "aws_subnet" "default-vpc-public-subnet" {
  vpc_id     = aws_vpc.default-vpc.id
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "fastcampus-default-vpc-public-subnet"
  }
}

# Creating aws vpc private subnet
resource "aws_subnet" "default-vpc-private-subnet" {
  vpc_id     = aws_vpc.default-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "fastcampus-default-vpc-private-subnet"
  }
}

# Creating aws vpc internet gateway
resource "aws_internet_gateway" "default-vpc-igw" {
  vpc_id = aws_vpc.default-vpc.id
  tags = {
    Name = "fastcampus-default-vpc-igw"
  }
}

# Creating aws vpc route table
resource "aws_route_table" "default-vpc-route-public" {
  vpc_id = aws_vpc.default-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.default-vpc-igw.id
  }

  tags = {
    Name = "fastcampus-default-vpc-route-table-public"
  }
}

# Connecting aws vpc route table to public subnet
resource "aws_route_table_association" "default-vpc-route-public-subnet" {
  subnet_id      = aws_subnet.default-vpc-public-subnet.id
  route_table_id = aws_route_table.default-vpc-route-public.id
}