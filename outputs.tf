output "contoso_rg_id" {
  value       = azurerm_resource_group.contoso_rg.id
  description = "The resource ID of the primary Contoso resource group"
  sensitive   = true
}

output "contoso_dev_rg_id" {
  value       = azurerm_resource_group.contoso_dev_rg.id
  description = "The resource ID of the development Contoso resource group"
}
