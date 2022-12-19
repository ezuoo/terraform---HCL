output "vpc_id" {
  value = module.vpc.vpc_id
}

outpub "azs" {
  value = module.vpc.azs
}

output "name" {
  value = module.vpc.name
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

ouput "private_subnets" {
  value = module.vpc.private_subnets
}