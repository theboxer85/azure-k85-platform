terraform {
  required_version = ">= 1.14.8"
  
  backend "azurerm" {
    resource_group_name = "rg-terraform-state"
    storage_account_name = "stk85tfstate13413"
    container_name = "tfstate"
    key = "platform/connectivity/terraform.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "<= 4.66.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "<= 3.8.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

provider "azuread" {
}

resource "azurerm_management_group" "root" {
  display_name = "k85-root"
}

resource "azurerm_management_group" "platform" {
  display_name               = "k85-platform"
  parent_management_group_id = azurerm_management_group.root.id
}

resource "azurerm_management_group" "workloads" {
  display_name               = "k85-workloads"
  parent_management_group_id = azurerm_management_group.root.id
}

resource "azurerm_management_group" "production" {
  display_name               = "k85-production"
  parent_management_group_id = azurerm_management_group.workloads.id
}

resource "azurerm_management_group" "non_production" {
  display_name               = "k85-non-production"
  parent_management_group_id = azurerm_management_group.workloads.id
}

resource "azurerm_resource_group" "connectivity" {
  name     = "k85-connectivity"
  location = var.location

  tags = {
    environment = "platform"
    CostCenter  = "IT-Infrastructure"
    ManagedBy   = "Terraform"
  }
}

