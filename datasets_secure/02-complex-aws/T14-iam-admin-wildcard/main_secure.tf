resource "aws_iam_policy" "vulnerable_admin_policy" {
  name        = "t14_wildcard_policy"
  description = "T14: IAM Policy with wildcard privileges"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "s3:ListBucket"
        Resource = "arn:aws:s3:::example-bucket"
      }
    ]
  })
}