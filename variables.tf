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
