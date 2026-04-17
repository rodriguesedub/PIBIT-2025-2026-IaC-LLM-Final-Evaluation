resource "aws_iam_role" "test_role_t15" {
  name = "test_role_t15"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy" "vulnerable_passrole_policy" {
  name = "vulnerable_passrole_policy"
  role = aws_iam_role.test_role_t15.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "iam:PassRole"
        Resource = "arn:aws:iam::123456789012:role/SpecificRole"
      }
    ]
  })
}