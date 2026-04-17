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
        Condition = {
          Bool = {
            "aws:MultiFactorAuthPresent" = "true"
          }
        }
      }
    ]
  })
}