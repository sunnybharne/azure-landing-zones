terraform {
  required_providers {
    azapi = {
      source  = "Azure/azapi"
      version = "~>2.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }
  backend "azurerm" {
    # Backend configuration is provided via -backend-config flags
  }
}

provider "azurerm" {
  features {}
  tenant_id = "99e184df-412c-45ed-b033-63f70449fe62"
}

provider "azapi" {
  tenant_id = "99e184df-412c-45ed-b033-63f70449fe62"
}

provider "random" {
}

variable "first_hirarchy" {
  description = "First hierarchy management groups."
  type = object({
    parent_id = string
    management_groups = list(object({
      id           = string
      display_name = string
    }))
  })
}

variable "platform_hirarchy" {
  description = "Platform hierarchy management groups."
  type = object({
    parent_id = string
    management_groups = list(object({
      id           = string
      display_name = string
    }))
  })
}

variable "landing_zone_hirarchy" {
  description = "Landing zone hierarchy management groups."
  type = object({
    parent_id = string
    management_groups = list(object({
      id           = string
      display_name = string
    }))
  })
}

resource "azurerm_management_group" "first_hirarchy" {
  for_each                   = { for mg in var.first_hirarchy.management_groups : mg.id => mg }
  name                       = each.value.id
  display_name               = each.value.display_name
  parent_management_group_id = var.first_hirarchy.parent_id
}

resource "azurerm_management_group" "platform_hirarchy" {
  for_each                   = { for mg in var.platform_hirarchy.management_groups : mg.id => mg }
  name                       = each.value.id
  display_name               = each.value.display_name
  parent_management_group_id = var.platform_hirarchy.parent_id
  depends_on                 = [azurerm_management_group.first_hirarchy]
}

resource "azurerm_management_group" "landing_zone_hirarchy" {
  for_each                   = { for mg in var.landing_zone_hirarchy.management_groups : mg.id => mg }
  name                       = each.value.id
  display_name               = each.value.display_name
  parent_management_group_id = var.landing_zone_hirarchy.parent_id
  depends_on                 = [azurerm_management_group.first_hirarchy]
}

output "first_hirarchy_ids" {
  description = "IDs of the first hierarchy management groups."
  value       = azurerm_management_group.first_hirarchy
}

output "platform_hirarchy_ids" {
  description = "IDs of the platform hierarchy management groups."
  value       = azurerm_management_group.platform_hirarchy
}

output "landing_zone_hirarchy_ids" {
  description = "IDs of the landing zone hierarchy management groups."
  value       = azurerm_management_group.landing_zone_hirarchy
}
