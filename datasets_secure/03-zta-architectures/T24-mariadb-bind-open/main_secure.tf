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
    "--bind-address=127.0.0.1"
  ]

  env = [
    "MYSQL_ROOT_PASSWORD=rootpassword"
  ]

  ports {
    internal = 3306
    external = 3306
  }
}