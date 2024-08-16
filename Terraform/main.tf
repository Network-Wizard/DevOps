resource "docker_image" "alpine" {
  name = "alpine:latest"
}

resource "docker_container" "alpine_container" {
  name  = "my_alpine_container"
  image = docker_image.alpine.name  # Use name instead of id
  command = ["sh", "-c", "while true; do echo hello world; sleep 5; done"]
  working_dir = "/tmp"
  env = ["EXAMPLE_ENV_VAR=TerraformDocker"]

  memory = 134217728  # 128 MB in bytes
  cpu_shares = 256
}
