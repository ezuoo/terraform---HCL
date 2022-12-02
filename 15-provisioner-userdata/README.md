# 15-provisioner-userdata

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.75.2 |
| <a name="provider_null"></a> [null](#provider\_null) | 3.2.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_security_group"></a> [security\_group](#module\_security\_group) | tedilabs/network/aws//modules/security-group | 0.26.1 |

## Resources

| Name | Type |
|------|------|
| [aws_default_vpc.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_vpc) | resource |
| [aws_instance.provisioner](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_instance.userdata](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [null_resource.provisioner](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [aws_ami.ubuntu](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_provisioner_instance"></a> [provisioner\_instance](#output\_provisioner\_instance) | n/a |
| <a name="output_user_instance"></a> [user\_instance](#output\_user\_instance) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
