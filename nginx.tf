terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

provider "docker" {}

# Pull the latest nginx image
resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

# Run the nginx container
resource "docker_container" "nginx" {
  name  = "nginx-server"
  image = docker_image.nginx.image_id
  ports {
    internal = 80
    external = 8080
  }
}

