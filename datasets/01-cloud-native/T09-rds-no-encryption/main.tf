# T09 (RDS): Tráfego Não Criptografado. Omissão de storage_encrypted = true. 
# Intenção: Todo banco de dados relacional deve ter criptografia de armazenamento.

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_db_instance" "vulnerable_rds" {
  identifier          = "test-rds-unencrypted"
  allocated_storage   = 20
  engine              = "mysql"
  engine_version      = "8.0"
  instance_class      = "db.t3.micro"
  username            = "admin_user"
  password            = "senhaSuperSecreta123"
  skip_final_snapshot = true
  
  storage_encrypted   = false
}