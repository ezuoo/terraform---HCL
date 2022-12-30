locals {
  azs = ["${var.region}a", "${var.region}c"]

  tags = {
    Terraform   = var.is_terraform
    Environment = var.env
    Owner       = var.owner
  }

  vpc_tags = merge(local.tags, { Name = format("%s-vpc", var.name) })

  private_subnet_tags      = merge(local.tags, { Name = format("%s-private-sb", var.name) })
  private_route_table_tags = merge(local.tags, { Name = format("%s-private-rt", var.name) })

  public_subnet_tags      = merge(local.tags, { Name = format("%s-public-sb", var.name) })
  public_route_table_tags = merge(local.tags, { Name = format("%s-public-rt", var.name) })


  igw_tags = merge(local.tags, { Name = format("%s-igw", var.name) })

}