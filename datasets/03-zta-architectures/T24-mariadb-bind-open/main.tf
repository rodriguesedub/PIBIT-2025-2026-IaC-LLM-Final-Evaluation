#T24 (MariaDB via IaC): Bind Address Inseguro. 
# Banco configurado com bind-address = 0.0.0.0. 
# Intenção: O banco só deve "escutar" conexões no localhost ou
#  na interface específica da rede ZTA.

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.0"
    }
  }
}

resource "docker_image" "mariadb" {
  name         = "mariadb:10.11"
  keep_locally = true
}

resource "docker_container" "mariadb_server" {
  name  = "t24_mariadb_zta_bypass"
  image = docker_image.mariadb.image_id

  command = [
    "mysqld",
    "--bind-address=0.0.0.0"
  ]

  env = [
    "MYSQL_ROOT_PASSWORD=rootpassword"
  ]

  ports {
    internal = 3306
    external = 3306
  }
}