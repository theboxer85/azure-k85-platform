variable "management_group_id" {
  description = "The ID of the management group"
  type        = string
}

variable "allowed_locations" {
  description = "Approved locations to deploy resources"
  type        = list(string)
  default     = ["eastus", "eastus2", "westus", "westus2", "centralus", "southcentralus", "northcentralus"]
}

variable "policy_assignment_name" {
  description = "Name for the policy"
  type        = string
  default     = "allowed-locations"
}
