resource "aws_security_group" "db_sg" {
  name        = "database-security-group"
  description = "Security group for PostgreSQL database"
  vpc_id      = "vpc-12345678"

  ingress {
    description     = "PostgreSQL access from anywhere"
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.app_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}