# T13 (Security Group): Porta de Banco Exposta. Porta 5432 (PostgreSQL) aberta globalmente.
#  Intenção: Restringir portas de BD a Security Groups de aplicação (referência cruzada).

resource "aws_security_group" "db_sg" {
  name        = "database-security-group"
  description = "Security group for PostgreSQL database"
  vpc_id      = "vpc-12345678"

  ingress {
    description = "PostgreSQL access from anywhere"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}