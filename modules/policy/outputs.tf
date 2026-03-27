output "location_policy_assignment_id" {
  description = "Resource ID of the location restriction policy assignment"
  value       = azurerm_management_group_policy_assignment.restrict_locations.id
}

output "tagging_policy_assignment_id" {
  description = "Resource ID of the mandatory tagging policy assignment"
  value       = azurerm_management_group_policy_assignment.require_tags.id
}
