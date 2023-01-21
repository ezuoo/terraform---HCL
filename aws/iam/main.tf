#################################
# IAM USER
#################################
resource "aws_iam_user" "user" {
  for_each = var.users

  name = each.key

  tags = {
    Name      = each.key
    Group     = each.value["group"]
    Terraform = true
  }
}

#################################
# IAM GROUP
#################################
resource "aws_iam_group" "groups" {
  for_each = local.groups

  name = each.key

  depends_on = [
    aws_iam_user.user
  ]
}

#################################
# IAM ACCESS KEY
#################################
resource "aws_iam_access_key" "this" {
  count = length(local.activated_usernames)

  user = local.activated_usernames[count.index]

  depends_on = [
    aws_iam_user.user
  ]
}

#################################
# IAM USER LOGIN PROFILE
#################################
resource "aws_iam_user_login_profile" "this" {
  count = length(local.activated_usernames)

  user                    = local.activated_usernames[count.index]
  password_reset_required = true

  depends_on = [
    aws_iam_user.user
  ]
}

#################################
# IAM USER GROUP MEMBERSHIP
#################################
resource "aws_iam_user_group_membership" "this" {
  for_each = var.users

  user = each.key

  groups = [each.value["group"]]

  depends_on = [
    aws_iam_user.user,
    aws_iam_group.groups
  ]
}

