output "root_management_group_id" {
  description = "Root management group ID"
  value       = azurerm_management_group.root.id
}

output "connectivity_resource_group_name" {
  description = "Connectivity hub resource group name"
  value       = azurerm_resource_group.connectivity.name
}

output "connectivity_resource_group_id" {
  description = "Connectivity hub resource group ID"
  value       = azurerm_resource_group.connectivity.id
}