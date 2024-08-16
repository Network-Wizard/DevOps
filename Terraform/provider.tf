terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.21.0"  # You can use the latest version or any specific version you prefer
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"  # For Linux/MacOS
  # For Windows: host = "npipe:////./pipe/docker_engine"
}
