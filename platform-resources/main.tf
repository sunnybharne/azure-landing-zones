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
  }
}

provider "azurerm" {
  features {}
  tenant_id       = "tenantId"
  subscription_id = "subscriptionId"
}

provider "azapi" {
  tenant_id       = "tenantId"
  subscription_id = "subscriptionId"
}

provider "random" {
}
