output "contoso_rg_id" {
  value       = azurerm_resource_group.contoso_rgs["primary"].id
  description = "The resource ID of the primary Contoso resource group"
  sensitive   = true
}

output "contoso_dev_rg_id" {
  value       = azurerm_resource_group.contoso_rgs["dev"].id
  description = "The resource ID of the development Contoso resource group"
}

output "contoso_rg_ids" {
  value       = { for key, rg in azurerm_resource_group.contoso_rgs : key => rg.id }
  description = "Map of all created resource group IDs keyed by resource_groups entry"
}
