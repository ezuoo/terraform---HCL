# network

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~>1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.48.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | 3.18.1 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enable_ipv6"></a> [enable\_ipv6](#input\_enable\_ipv6) | enable IPv6 | `bool` | `false` | no |
| <a name="input_enable_nat_gateway"></a> [enable\_nat\_gateway](#input\_enable\_nat\_gateway) | enable NAT gateway | `bool` | `false` | no |
| <a name="input_enable_vpn_gateway"></a> [enable\_vpn\_gateway](#input\_enable\_vpn\_gateway) | enable VPN gateway (vgw) | `bool` | `false` | no |
| <a name="input_env"></a> [env](#input\_env) | environment | `string` | `"development"` | no |
| <a name="input_is_terraform"></a> [is\_terraform](#input\_is\_terraform) | n/a | `bool` | `true` | no |
| <a name="input_name"></a> [name](#input\_name) | name | `string` | `"default"` | no |
| <a name="input_owner"></a> [owner](#input\_owner) | created by | `string` | `"jawn"` | no |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | list of private subnet | `list(string)` | n/a | yes |
| <a name="input_public_subnets"></a> [public\_subnets](#input\_public\_subnets) | list of public subnet | `list(string)` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | vpc region | `string` | `"ap-northeast-2"` | no |
| <a name="input_single_nat_gateway"></a> [single\_nat\_gateway](#input\_single\_nat\_gateway) | enable single NAT gateway | `bool` | `false` | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | vpc cidr block | `string` | `"10.0.0.0/16"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_azs"></a> [azs](#output\_azs) | n/a |
| <a name="output_name"></a> [name](#output\_name) | output "vpc" { value = module.vpc } |
| <a name="output_private_subnet_tags"></a> [private\_subnet\_tags](#output\_private\_subnet\_tags) | n/a |
| <a name="output_private_subnets"></a> [private\_subnets](#output\_private\_subnets) | n/a |
| <a name="output_public_subnet_tags"></a> [public\_subnet\_tags](#output\_public\_subnet\_tags) | n/a |
| <a name="output_public_subnets"></a> [public\_subnets](#output\_public\_subnets) | n/a |
| <a name="output_tags"></a> [tags](#output\_tags) | n/a |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | n/a |
| <a name="output_vpc_tags"></a> [vpc\_tags](#output\_vpc\_tags) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
