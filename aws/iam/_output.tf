output "users" {
  value = keys(var.users)
}

output "groups" {
  value = local.groups
}

output "activated_users" {
  value = local.activated_users
}


