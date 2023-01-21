locals {
  groups = toset([for k, v in var.users : v["group"]])

  activated_usernames = concat(var.activated_users, [for k, v in var.users : k if v["activated"]])

  activated_users = { for k, v in local.activated_usernames : v => aws_iam_user_login_profile.this[k].password }
}