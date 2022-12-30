terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "jawn"

    workspaces {
      name = "practice-cloud-backend"
    }
  }
}