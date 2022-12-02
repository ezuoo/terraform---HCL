terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "jawn"
    workspaces {
      name = "terraform-cloud-backend"
    }
  }
}

###################################################
# Local Variables
###################################################
locals {
  aws_accounts = {
    fastcampus = {
      id     = "xxxxxx"
      region = "ap-northeast-2"
      alian  = "jawn-fastcampus"
    }
  }
  context = yamldecode(file(var.config_file)).context
  config  = yamldecode(templatefile(var.config_file, local.context))
}

###################################################
# Providers
###################################################

provider "aws" {
  region = local.aws_accounts.fastcampus.region

  # Only these AWS Account IDs may be operated on by this template
  allowed_account_ids = [local.aws_accounts.fastcampus.id]

  assume_role {
    role_arn     = "arn:aws:iam::${local.aws_accounts.fastcampus.id}:role/terraform-access"
    session_name = local.context.workspace
  }
}