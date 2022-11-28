provider "aws" {
  region = "ap-northeast-2"
}

# variable "list" {
#   type    = list(string)
#   default = ["abc", "abcd", ""]
# }

# output "loop" {
#   value = {
#     List = [
#       for k, v in var.list : "Length of ${v} : ${length(v)}"

#     ]
#     Map = { for s in var.list : s => upper(s) }
#   }
# }



# resource "aws_iam_user_policy_attachment" "developer" {
#   for_each = {
#     for user in local.developers : user.name => user
#   }

#   user       = each.key
#   policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"

#   depends_on = [
#     aws_iam_user.this
#   ]
# }

# output "developers" {
#   value = local.developers
# }

variable "groups" {
  type = list(string)
}
variable "users" {
  type = list(any)
}



resource "aws_iam_group" "developer" {
  name = "developer"
}
resource "aws_iam_group" "employee" {

  name = "employee"
}

resource "aws_iam_user" "users" {
  for_each = { for user in var.users : user.name => user }

  name = each.key

  tags = {
    Level = each.value.level
    Role  = each.value.role
  }
}

resource "aws_iam_user_group_membership" "this" {
  for_each = { for user in var.users : user.name => user }

  user = each.key

  groups = each.value.is_developer ? [aws_iam_group.developer.name, aws_iam_group.employee.name] : [aws_iam_group.employee.name]
}

locals {
  developers = [
    for user in var.users : user if user.is_developer
  ]
}
resource "aws_iam_user_policy_attachment" "developer" {
  for_each = {
    for user in local.developers : user.name => user
  }

  user       = each.key
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"

  depends_on = [
    aws_iam_user.users
  ]
}

output "variable" {
  value = {
    Groups : [for group_name in var.groups : group_name]
    # Groups : aws_iam_group.this
    Users : { for user in var.users : user.name => user }
    Developers : [for developer in local.developers : developer.name]
  }

}
