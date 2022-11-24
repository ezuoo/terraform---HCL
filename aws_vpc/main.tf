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

# Data :  aws vpc network acls's ids
# data "aws_network_acls" "vpc_acls" {
#   vpc_id = aws_vpc.default-vpc.id
# }

# output "acls" {
#   value = data.aws_network_acls.vpc_acls
# }

# Creating aws vpc public network acl
resource "aws_network_acl" "default-vpc-public-network-acl" {
  vpc_id = aws_vpc.default-vpc.id

  subnet_ids = [aws_subnet.default-vpc-public-subnet.id]

  tags = {
    Name = "default-vpc-public-NACL"
  }
}

# Creating aws vpc public network acl rule
resource "aws_network_acl_rule" "default-vpc-public-network-acl-rule" {
  network_acl_id = aws_network_acl.default-vpc-public-network-acl.id

  rule_number = 100
  egress      = false
  protocol    = "tcp"
  rule_action = "allow"
  cidr_block  = "0.0.0.0/0"
  from_port   = 22
  to_port     = 22

}