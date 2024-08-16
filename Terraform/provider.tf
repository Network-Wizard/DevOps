provider "docker" {
  host = "unix:///var/run/docker.sock"  # For Linux/MacOS
  # For Windows: host = "npipe:////./pipe/docker_engine"
}
