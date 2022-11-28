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

resource "aws_iam_group" "developer" {
  name = "developer"
}

resource "aws_iam_group" "employee" {
  name = "employee"
}

output "groups" {
  value = [
    aws_iam_group.developer,
    aws_iam_group.employee
  ]
}



variable "users" {
  type = list(any)
}

resource "aws_iam_user" "this" {
  for_each = {
    for user in var.users : user.name => user
  }

  name = each.key

  tags = {
    level = each.value.level
    role  = each.value.role
  }
}

resource "aws_iam_user_group_membership" "this" {
  for_each = {
    for user in var.users : user.name => user
  }

  user   = each.key
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
    aws_iam_user.this
  ]
}

output "developers" {
  value = local.developers
}