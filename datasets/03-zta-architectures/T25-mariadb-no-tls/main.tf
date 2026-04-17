#T25 (MariaDB via IaC): TLS Não Exigido.
#  Omissão de require_secure_transport = ON. 
# Intenção: Em Zero Trust, a rede interna é considerada hostil;
#  logo, a criptografia end-to-end é obrigatória.

provider "aws" {
  region = "us-east-1"
}

resource "aws_db_parameter_group" "mariadb_params" {
  name   = "mariadb-insecure-params"
  family = "mariadb10.6"

  # Configurações genéricas aplicadas, omitindo intencionalmente a exigência de TLS
  parameter {
    name  = "max_connections"
    value = "100"
  }
}

resource "aws_db_instance" "mariadb_instance" {
  allocated_storage    = 20
  engine               = "mariadb"
  engine_version       = "10.6"
  instance_class       = "db.t3.micro"
  db_name              = "secbenchdb"
  username             = "dbadmin"
  password             = "supersecret123"
  parameter_group_name = aws_db_parameter_group.mariadb_params.name
  skip_final_snapshot  = true
}