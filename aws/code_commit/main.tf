resource "aws_codecommit_repository" "terraform" {
  repository_name = "terraform-playgroud"
  description     = "Learn terraform"
}