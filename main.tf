variable "name" {
  description = "The name for the AWS account. Used for the account alias"
  type        = string
}

provider "aws" {
  region = "ap-northeast-2"
}

variable "db_username" {
  type        = string
  description = "사용자 이름"
}

variable "db_password" {
  type        = string
  description = "비밀번호"
}

resource "aws_db_instance" "myrds" {
  identifier_prefix   = "t101-sensitivedata"
  engine              = "mysql"
  allocated_storage   = 10
  instance_class      = "db.t2.micro"
  skip_final_snapshot = true

  db_name  = "sensitive_example"
  username = var.db_username
  password = var.db_password
}