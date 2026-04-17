#T10 (RDS): Retenção de Backup Zerada. Configuração backup_retention_period = 0.
# Intenção: Exigir uma janela de retenção de pelo menos 7 dias para recuperação de
#  desastres. fast

resource "aws_db_instance" "t10_vulnerable_rds" {
  allocated_storage       = 20
  engine                  = "mysql"
  engine_version          = "8.0"
  instance_class          = "db.t3.micro"
  username                = "admin"
  password                = "senha_teste_123"
  skip_final_snapshot     = true
  
  backup_retention_period = 7
}