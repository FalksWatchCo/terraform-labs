region = "UK South"

resource_groups = {
  primary = {
    name_suffix = "rg"
  }
  dev = {
    name_suffix = "dev_rg"
  }
  sandbox = {
    name_suffix = "sandbox_rg"
    tags = {
      environment = "sandbox"
    }
  }
}
