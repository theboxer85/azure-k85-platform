# ── Allowed Locations Policy ───────────────────────────────────────
# Built-in Azure Policy: Allowed locations
# Policy Definition ID is static across all Azure tenants

data "azurerm_policy_definition" "allowed_locations" {
  display_name = "Allowed locations"
}

resource "azurerm_management_group_policy_assignment" "restrict_locations" {
  name                 = var.policy_assignment_name
  display_name         = "Restrict resources to approved US regions"
  policy_definition_id = data.azurerm_policy_definition.allowed_locations.id
  management_group_id  = var.management_group_id

  parameters = jsonencode({
    listOfAllowedLocations = {
      value = var.allowed_locations
    }
  })
}

# ── Mandatory Tagging Policy ───────────────────────────────────────
# Deny any resource that is missing required tags

resource "azurerm_management_group_policy_assignment" "require_tags" {
  name                 = "require-mandatory-tags"
  display_name         = "Require mandatory tags on all resources"
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/96670d01-0a4d-4649-9c89-2d3abc0a5025"
  management_group_id  = var.management_group_id

  parameters = jsonencode({
    tagName = {
      value = "ManagedBy"
    }
  })
}
