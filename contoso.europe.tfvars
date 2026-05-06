region = "North Europe"

resource_groups = {
  primary = {
    name_suffix = "rg"
  }
  dev = {
    name_suffix = "dev_rg"
  }
  analytics = {
    name_suffix = "analytics_rg"
    tags = {
      workload = "analytics"
    }
  }
}
