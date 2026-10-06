# Tells AWS to trust login tokens issued by GitHub Actions
resource "aws_iam_openid_connect_provider" "github" {
  url            = "https://token.actions.githubusercontent.com"
  client_id_list = ["sts.amazonaws.com"]
}

# The role GitHub Actions uses. Only YOUR repo can use it.
resource "aws_iam_role" "github_actions" {
  name = "github-actions-secureship"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = { Federated = aws_iam_openid_connect_provider.github.arn }
      Action    = "sts:AssumeRoleWithWebIdentity"
      Condition = {
        StringEquals = {
          "token.actions.githubusercontent.com:aud" = "sts.amazonaws.com"
        }
        StringLike = {
          "token.actions.githubusercontent.com:sub" = "repo:jyue0013-creator/secureship:*"
        }
      }
    }]
  })
}

# Broad access to services, but NO IAM access...
resource "aws_iam_role_policy_attachment" "poweruser" {
  role       = aws_iam_role.github_actions.name
  policy_arn = "arn:aws:iam::aws:policy/PowerUserAccess"
}

# ...except managing the project's own roles (named secureship-*)
resource "aws_iam_role_policy" "project_iam" {
  name = "manage-secureship-roles"
  role = aws_iam_role.github_actions.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect   = "Allow"
      Action   = ["iam:*"]
      Resource = "arn:aws:iam::402545554662:role/secureship-*"
    }]
  })
}

output "github_actions_role_arn" {
  value = aws_iam_role.github_actions.arn
}