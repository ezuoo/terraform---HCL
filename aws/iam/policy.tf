resource "aws_iam_user_policy" "change_password" {
  count = length(local.activated_usernames)

  name = "Change_Password"
  user = local.activated_usernames[count.index]
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        "Effect" : "Allow",
        "Action" : ["iam:ChangePassword"]
        "Resource" : ["arn:aws:iam::*:user/${local.activated_usernames[count.index]}"]
      },
      {
        "Effect" : "Allow",
        "Action" : ["iam:GetAccountPasswordPolicy", "iam:ListUsers", "iam:ListGroups"],
        "Resource" : "*"
      },
    ]

  })

  depends_on = [aws_iam_user.user]
}