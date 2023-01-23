resource "aws_codecommit_repository" "terraform" {
  repository_name = "terraform-playground"
  description     = "Learn terraform"
}