# T26 (MariaDB via IaC): Privilégios Globais para Aplicação. 
# Criação do usuário do GLPI no banco de dados com a flag GRANT ALL PRIVILEGES ON *.*.
# Intenção: O usuário da aplicação deve ter privilégios restritos apenas ao schema do GLPI.

terraform {
  required_providers {
    mysql = {
      source  = "petoju/mysql"
      version = "~> 3.0"
    }
  }
}

provider "mysql" {
  endpoint = "mariadb-server.local:3306"
  username = "root"
  password = "root_password"
}

resource "mysql_database" "glpi_db" {
  name = "glpidb"
}

resource "mysql_user" "glpi_user" {
  user               = "glpi"
  host               = "%"
  plaintext_password = "glpi_password"
}

resource "mysql_grant" "glpi_global_grant" {
  user       = mysql_user.glpi_user.user
  host       = mysql_user.glpi_user.host
  database   = "*"
  table      = "*"
  privileges = ["ALL"]
}