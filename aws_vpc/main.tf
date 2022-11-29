provider "aws" {
  region = "ap-northeast-2"
}

# Creating aws vpc
resource "aws_vpc" "default-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "default-vpc"
  }
}

# Creating aws vpc public subnet
resource "aws_subnet" "default-vpc-public-subnet" {
  vpc_id = aws_vpc.default-vpc.id

  cidr_block              = "10.0.0.0/24"
  availability_zone       = "ap-northeast-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "default-vpc-public-subnet"
  }
}

# Creating aws vpc private subnet
resource "aws_subnet" "default-vpc-private-subnet" {
  vpc_id     = aws_vpc.default-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "default-vpc-private-subnet"
  }
}

# Creating aws vpc internet gateway
resource "aws_internet_gateway" "default-vpc-igw" {
  vpc_id = aws_vpc.default-vpc.id
  tags = {
    Name = "default-vpc-igw"
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
    Name = "default-vpc-route-table-public"
  }
}

# Connecting aws vpc route table to public subnet
resource "aws_route_table_association" "default-vpc-route-public-subnet" {
  subnet_id      = aws_subnet.default-vpc-public-subnet.id
  route_table_id = aws_route_table.default-vpc-route-public.id
}

# Creating aws vpc public network acl
resource "aws_network_acl" "default-vpc-public-network-acl" {
  vpc_id = aws_vpc.default-vpc.id

  subnet_ids = [aws_subnet.default-vpc-public-subnet.id]

  tags = {
    Name = "default-vpc-public-NACL"
  }
}

# Creating aws vpc public network acl rule : ssh
resource "aws_network_acl_rule" "network-acl-rule-inbound-ssh" {
  network_acl_id = aws_network_acl.default-vpc-public-network-acl.id

  rule_number = 100
  egress      = false
  protocol    = "tcp"
  rule_action = "allow"
  cidr_block  = "0.0.0.0/0"
  from_port   = 22
  to_port     = 22

}

# Creating aws vpc public network acl rule : http
resource "aws_network_acl_rule" "network-acl-rule-inbound-http" {
  network_acl_id = aws_network_acl.default-vpc-public-network-acl.id

  rule_number = 200
  egress      = false
  protocol    = "tcp"
  rule_action = "allow"
  cidr_block  = "0.0.0.0/0"
  from_port   = 80
  to_port     = 80

}

# Creating aws vpc public network acl rule : https
resource "aws_network_acl_rule" "network-acl-rule-inbound-https" {
  network_acl_id = aws_network_acl.default-vpc-public-network-acl.id

  rule_number = 300
  egress      = false
  protocol    = "tcp"
  rule_action = "allow"
  cidr_block  = "0.0.0.0/0"
  from_port   = 443
  to_port     = 443

}

resource "aws_network_acl_rule" "network-acl-rule-outbound" {
  network_acl_id = aws_network_acl.default-vpc-public-network-acl.id

  rule_number = 100
  egress      = true
  protocol    = "tcp"
  rule_action = "allow"
  cidr_block  = "0.0.0.0/0"
  # from_port   = "1024-65535"
  # to_port     = "1024-65535"

}

# output "nacl-rule-outbound" {
#   value = aws_network_acl_rule.network-acl-rule-outbound
# }


