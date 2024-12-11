terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
  required_version = ">=1.8.4" /*Многострочный комментарий.
 Требуемая версия terraform */
}

provider "docker" {
    host = "ssh://debian@89.169.132.237"
}

variable "mysql_root_password" {
  description = "mysql root password"
  type        = string
  default = "YtReWq4321"
}

variable "mysql_password" {
  description = "mysql password"
  type        = string
  default = "QwErTy1234"
}

#однострочный комментарий

resource "random_password" "random_string" {
  length      = 16
  special     = false
  min_upper   = 1
  min_lower   = 1
  min_numeric = 1
}

/*
resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = true
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "example_${random_password.random_string.result}"

  ports {
    internal = 80
    external = 9090
  }
}

resource "docker_image" "mysql" {
  name = "mysql:8.0"
}
*/

resource "docker_container" "mysql" {
  image = docker_image.mysql.image_id
  name  = "example_${random_password.random_string.result}"

  env = [
    "MYSQL_ROOT_PASSWORD=${var.mysql_root_password}",
    "MYSQL_DATABASE=wordpress",
    "MYSQL_USER=wordpress",
    "MYSQL_PASSWORD=${var.mysql_password}",
    "MYSQL_ROOT_HOST=%"
  ]

  ports {
    internal = 3306
    external = 3306
    ip       = "127.0.0.1"
  }
}

