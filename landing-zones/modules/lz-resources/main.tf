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


variable "resourceGroupName" {
  description = "The name of the resource group."
  type        = string
}

variable "vnetName" {
  description = "The name of the vnet."
  type        = string
}

variable "location" {
  description = "The Azure region where resources will be created."
  type        = string
}

variable "tags" {
  description = "Tags to apply to the resources."
  type        = map(string)
}

resource "azurerm_resource_group" "core_rg" {
  name     = var.resourceGroupName
  location = var.location
  tags     = var.tags
}

resource "azurerm_virtual_network" "core_vnet" {
  name                = var.vnetName
  location            = var.location
  resource_group_name = azurerm_resource_group.core_rg.name
  address_space       = ["10.0.0.0/16"]
  # dns_servers         = ["10.0.0.4"]
  #
}
