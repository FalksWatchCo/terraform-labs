variable "prefix" {
  type        = string
  default     = "contoso"
  description = "Prefix used when naming resources"

  validation {
    condition     = length(trimspace(var.prefix)) > 0
    error_message = "The prefix must not be empty."
  }
}

variable "region" {
  type        = string
  default     = "UK South"
  description = "The Azure region to deploy resources"
  validation {
    condition     = contains(["UK South", "UK West", "North Europe", "West Europe", "East US", "West US"], var.region)
    error_message = "Invalid region"
  }
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "A map of tags"
}

variable "resource_groups" {
  type = map(object({
    name_suffix = string
    location    = optional(string)
    tags        = optional(map(string))
  }))

  description = "Map of resource groups to create. Supports per-group location and tags overrides."

  default = {
    primary = {
      name_suffix = "rg"
    }
    dev = {
      name_suffix = "dev_rg"
    }
  }

  validation {
    condition = (
      contains(keys(var.resource_groups), "primary") &&
      contains(keys(var.resource_groups), "dev") &&
      alltrue([for rg in values(var.resource_groups) : length(trimspace(rg.name_suffix)) > 0])
    )
    error_message = "resource_groups must include non-empty primary/dev entries with name_suffix values."
  }
}
