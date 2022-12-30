data "terraform_remote_state" "vpc" {
  backend = "remote"

  config = {
    organization = "jawn"

    workspaces = {
      name = "practice-cloud-backend"
    }
  }
}

output "name" {
  value = data.terraform_remote_state.vpc.outputs.name
}

output "vpc_id" {
  value = data.terraform_remote_state.vpc.outputs.vpc_id
}
