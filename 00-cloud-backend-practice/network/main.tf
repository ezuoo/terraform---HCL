module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.18.1"

  azs  = local.azs
  name = var.name
  cidr = var.vpc_cidr

  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_vpn_gateway = var.enable_vpn_gateway
  enable_ipv6        = var.enable_ipv6
  enable_nat_gateway = var.enable_nat_gateway
  single_nat_gateway = var.single_nat_gateway



  tags     = local.tags
  vpc_tags = local.vpc_tags
  igw_tags = local.igw_tags

  public_subnet_tags      = local.public_subnet_tags
  public_route_table_tags = local.public_route_table_tags

  private_subnet_tags      = local.private_subnet_tags
  private_route_table_tags = local.private_route_table_tags
}