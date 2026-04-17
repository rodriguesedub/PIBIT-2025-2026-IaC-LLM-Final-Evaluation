# T27 (MariaDB via IaC): Retenção de Logs de Auditoria. 
# Omissão do plugin de auditoria ou tempo de expiração curto. 
# Intenção: Exigir logs rigorosos de todas as queries administrativas para perícia.

resource "aws_db_option_group" "mariadb_options_t27" {
  name                 = "mariadb-options-t27"
  engine_name          = "mariadb"
  major_engine_version = "10.6"
}

resource "aws_db_instance" "mariadb_t27" {
  identifier           = "mariadb-t27"
  engine               = "mariadb"
  engine_version       = "10.6"
  instance_class       = "db.t3.micro"
  allocated_storage    = 20
  username             = "admin"
  password             = "Password123!"
  option_group_name    = aws_db_option_group.mariadb_options_t27.name
  skip_final_snapshot  = true
}