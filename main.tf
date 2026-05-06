terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
  resource_provider_registrations = "core"
}

moved {
  from = azurerm_resource_group.contoso_rg
  to   = azurerm_resource_group.contoso_rgs["primary"]
}

moved {
  from = azurerm_resource_group.contoso_dev_rg
  to   = azurerm_resource_group.contoso_rgs["dev"]
}

resource "azurerm_resource_group" "contoso_rgs" {
  for_each = var.resource_groups

  name     = "${var.prefix}_${each.value.name_suffix}"
  location = coalesce(try(each.value.location, null), var.region)
  tags     = merge(var.tags, try(each.value.tags, {}))
}