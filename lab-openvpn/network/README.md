# network

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_route_table__private"></a> [route\_table\_\_private](#module\_route\_table\_\_private) | tedilabs/network/aws//modules/route-table | 0.24.0 |
| <a name="module_route_table__public"></a> [route\_table\_\_public](#module\_route\_table\_\_public) | tedilabs/network/aws//modules/route-table | 0.24.0 |
| <a name="module_subnet_group"></a> [subnet\_group](#module\_subnet\_group) | tedilabs/network/aws//modules/subnet-group | 0.24.0 |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | tedilabs/network/aws//modules/vpc | 0.26.1 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_config_file"></a> [config\_file](#input\_config\_file) | The path of configuration YAML file. | `string` | `"./config.yaml"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_subnet_groups"></a> [subnet\_groups](#output\_subnet\_groups) | n/a |
| <a name="output_vpc"></a> [vpc](#output\_vpc) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
