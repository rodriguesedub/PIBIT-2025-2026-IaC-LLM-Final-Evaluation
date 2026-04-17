# T17 (IAM): Política Sem MFA. 
# Permissões sensíveis de alteração de infraestrutura sem aws:MultiFactorAuthPresent. 
# Intenção: Exigir autenticação multifator para ações destrutivas.

resource "aws_iam_policy" "sensitive_actions_no_mfa" {
  name        = "destructive-actions-policy"
  description = "Policy allowing destructive actions"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ec2:TerminateInstances",
          "s3:DeleteBucket",
          "rds:DeleteDBInstance"
        ]
        Resource = "*"
      }
    ]
  })
}