# output "vpc" {
#   value = module.vpc
# }
output "name" {
  value = module.vpc.name
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "azs" {
  value = local.azs
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "private_subnets" {
  value = module.vpc.private_subnets
}

output "tags" {
  value = local.tags
}

output "vpc_tags" {
  value = local.vpc_tags
}

output "private_subnet_tags" {
  value = local.private_subnet_tags
}

output "public_subnet_tags" {
  value = local.public_subnet_tags
}

