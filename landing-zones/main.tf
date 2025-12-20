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

locals {
  files      = fileset(path.module, "**/*.json")
  files_maps = { for x in local.files : "${basename(dirname("${path.cwd}/${x}"))}/${jsondecode("${file(x)}").name}-${jsondecode("${file(x)}").metadata.version}" => jsondecode(file(x)) }
}

# Landing zone resources will be defined here based on JSON configuration files
# Example structure - replace with actual landing zone resources
# resource "azurerm_resource_group" "example" {
#   for_each = local.files_maps
#   name     = each.value.name
#   location = each.value.location
# }

output "landing_zones" {
  description = "Map of all landing zone resources created."
  value       = {} # Update with actual outputs when resources are defined
}

