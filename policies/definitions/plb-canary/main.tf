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
  files_maps = { for x in local.files : "${basename(dirname("${path.cwd}/${x}"))}-${jsondecode("${file(x)}").name}-${jsondecode("${file(x)}").metadata.version}" => jsondecode(file(x)) }
}

resource "azurerm_policy_definition" "definition" {
  for_each            = local.files_maps
  name                = each.value.name
  policy_type         = each.value.policyType
  mode                = each.value.mode
  display_name        = each.value.displayName
  description         = each.value.description
  metadata            = jsonencode(each.value.metadata)
  parameters          = jsonencode(each.value.parameters)
  policy_rule         = jsonencode(each.value.policyRule)
  management_group_id = "/providers/Microsoft.Management/managementGroups/${split("/", each.key)[0]}"
}

output "policy_definitions" {
  description = "Map of all policy definitions created."
  value       = azurerm_policy_definition.definition
}
