# T14 (IAM Policy): Privilégios Curinga (Admin). 
# Uso de Action = "*" e Resource = "*". 
# Intenção: Implementar o Princípio do Menor Privilégio, proibindo uso de curingas em políticas de permissão.

resource "aws_iam_policy" "vulnerable_admin_policy" {
  name        = "t14_wildcard_policy"
  description = "T14: IAM Policy with wildcard privileges"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "*"
        Resource = "*"
      }
    ]
  })
}