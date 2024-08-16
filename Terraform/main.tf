# Define a Docker image resource for Alpine Linux
resource "docker_image" "alpine" {
  name = "alpine:latest"
}

# Create a Docker container from the Alpine image
resource "docker_container" "alpine_container" {
  name  = "my_alpine_container"
  image = docker_image.alpine.latest
  
  # Command to run when the container starts
  command = ["sh", "-c", "while true; do echo hello world; sleep 5; done"]

  # Optional: You can specify a working directory, environment variables, etc.
  working_dir = "/tmp"

  # Example environment variable
  env = ["EXAMPLE_ENV_VAR=TerraformDocker"]

  # Optional: Limit container's resources (e.g., memory, CPU)
  memory = "128m"
  cpu_shares = 256
}
