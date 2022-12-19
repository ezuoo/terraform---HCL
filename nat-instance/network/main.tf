module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "natgateway_vpc"
  cidr = "10.0.0.0/16"

  azs             = ["ap-northeast-2a"]
  private_subnets = ["10.0.1.0/24", ]
  public_subnets  = ["10.0.101.0/24"]

  enable_nat_gateway = false
  enable_vpn_gateway = true

  tags = {
    Environment = "dev"
    Owner       = "jawn"
  }
}