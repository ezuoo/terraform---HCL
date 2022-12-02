# 14-directory-structure

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 3.0 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_nacl"></a> [nacl](#module\_nacl) | tedilabs/network/aws//modules/nacl | 0.26.1 |
| <a name="module_nat_gw"></a> [nat\_gw](#module\_nat\_gw) | tedilabs/network/aws//modules/nat-gateway | 0.26.1 |
| <a name="module_route_table__app_private"></a> [route\_table\_\_app\_private](#module\_route\_table\_\_app\_private) | tedilabs/network/aws//modules/route-table | 0.24.0 |
| <a name="module_route_table__data_private_managed"></a> [route\_table\_\_data\_private\_managed](#module\_route\_table\_\_data\_private\_managed) | tedilabs/network/aws//modules/route-table | 0.24.0 |
| <a name="module_route_table__data_private_self"></a> [route\_table\_\_data\_private\_self](#module\_route\_table\_\_data\_private\_self) | tedilabs/network/aws//modules/route-table | 0.24.0 |
| <a name="module_route_table__net_private"></a> [route\_table\_\_net\_private](#module\_route\_table\_\_net\_private) | tedilabs/network/aws//modules/route-table | 0.24.0 |
| <a name="module_route_table__net_public"></a> [route\_table\_\_net\_public](#module\_route\_table\_\_net\_public) | tedilabs/network/aws//modules/route-table | 0.24.0 |
| <a name="module_subnet_group"></a> [subnet\_group](#module\_subnet\_group) | tedilabs/network/aws//modules/subnet-group | 0.24.0 |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | tedilabs/network/aws//modules/vpc | 0.24.0 |
| <a name="module_vpc_gateway_endpoint"></a> [vpc\_gateway\_endpoint](#module\_vpc\_gateway\_endpoint) | tedilabs/network/aws//modules/vpc-gateway-endpoint | 0.24.0 |

## Resources

| Name | Type |
|------|------|
| [aws_default_network_acl.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_network_acl) | resource |
| [aws_default_route_table.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_route_table) | resource |
| [aws_ec2_managed_prefix_list.ipv4](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_managed_prefix_list) | resource |
| [aws_ec2_managed_prefix_list.ipv6](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_managed_prefix_list) | resource |
| [aws_eip.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [terraform_remote_state.this](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_config_file"></a> [config\_file](#input\_config\_file) | The path of configuration YAML file. | `string` | `"./config.yaml"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_config"></a> [config](#output\_config) | n/a |
| <a name="output_eip"></a> [eip](#output\_eip) | n/a |
| <a name="output_gateway_endpoints"></a> [gateway\_endpoints](#output\_gateway\_endpoints) | n/a |
| <a name="output_nacl"></a> [nacl](#output\_nacl) | n/a |
| <a name="output_nat_gateway"></a> [nat\_gateway](#output\_nat\_gateway) | n/a |
| <a name="output_prefix_lists"></a> [prefix\_lists](#output\_prefix\_lists) | n/a |
| <a name="output_subnet_groups"></a> [subnet\_groups](#output\_subnet\_groups) | n/a |
| <a name="output_vpc"></a> [vpc](#output\_vpc) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
