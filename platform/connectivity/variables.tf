variable "subscription_id" {
  description = "The Azure subscription ID to deploy resources into"
  type        = string
}

variable "location" {
  description = "Primary Azure region"
  type        = string
  default     = "East US 2"
}

variable "firm_name" {
  description = "Short name for the resource group to create"
  type        = string
  default     = "k85"
}
