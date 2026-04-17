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
  database   = mysql_database.glpi_db.name
  table      = "*"
  privileges = ["ALL"]
}