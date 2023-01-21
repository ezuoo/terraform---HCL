# iam

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.3.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~>4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.51.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_access_key.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key) | resource |
| [aws_iam_group.groups](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group) | resource |
| [aws_iam_user.user](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_group_membership.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_group_membership) | resource |
| [aws_iam_user_login_profile.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_login_profile) | resource |
| [aws_iam_user_policy.change_password](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_activated_users"></a> [activated\_users](#input\_activated\_users) | The list of enabled access Users | `list(string)` | `[]` | no |
| <a name="input_users"></a> [users](#input\_users) | The list of User | `map(map(string))` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_activated_users"></a> [activated\_users](#output\_activated\_users) | n/a |
| <a name="output_groups"></a> [groups](#output\_groups) | n/a |
| <a name="output_users"></a> [users](#output\_users) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
