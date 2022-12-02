# ec2-instance

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.45.0 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_sg__openvpn"></a> [sg\_\_openvpn](#module\_sg\_\_openvpn) | tedilabs/network/aws//modules/security-group | 0.26.1 |
| <a name="module_sg__ssh"></a> [sg\_\_ssh](#module\_sg\_\_ssh) | tedilabs/network/aws//modules/security-group | 0.26.1 |

## Resources

| Name | Type |
|------|------|
| [aws_eip.openvpn](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_eip_association.openvpn](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip_association) | resource |
| [aws_instance.openvpn](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_instance.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_ami.ubuntu](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [terraform_remote_state.this](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_config_file"></a> [config\_file](#input\_config\_file) | The path of configuration YAML file. | `string` | `"./config.yaml"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_openvpn_instance"></a> [openvpn\_instance](#output\_openvpn\_instance) | n/a |
| <a name="output_private_instance"></a> [private\_instance](#output\_private\_instance) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
