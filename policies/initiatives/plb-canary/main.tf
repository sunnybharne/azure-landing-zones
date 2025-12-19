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

resource "azurerm_management_group_policy_set_definition" "initiative" {
  for_each            = local.files_maps
  name                = each.value.name
  description         = each.value.description
  metadata            = jsonencode(each.value.metadata)
  policy_type         = each.value.policyType
  display_name        = each.value.displayName
  parameters          = jsonencode(each.value.parameters)
  management_group_id = "/providers/Microsoft.Management/managementGroups/${split("/", each.key)[0]}"

  dynamic "policy_definition_reference" {
    for_each = each.value.policy_definition_reference != null ? each.value.policy_definition_reference : []
    content {
      policy_definition_id = policy_definition_reference.value.policyDefinitionId
      parameter_values     = policy_definition_reference.value.parameterValues != null ? jsonencode(policy_definition_reference.value.parameterValues) : null
      reference_id         = policy_definition_reference.value.referenceId != null ? policy_definition_reference.value.referenceId : null
    }
  }

  dynamic "policy_definition_group" {
    for_each = each.value.policy_definition_group != null ? each.value.policy_definition_group : []
    content {
      name                            = policy_definition_group.value.name
      display_name                    = policy_definition_group.value.displayName != null ? policy_definition_group.value.displayName : null
      category                        = policy_definition_group.value.category != null ? policy_definition_group.value.category : null
      description                     = policy_definition_group.value.description != null ? policy_definition_group.value.description : null
      additional_metadata_resource_id = policy_definition_group.value.additionalMetadataResourceId != null ? policy_definition_group.value.additionalMetadataResourceId : null
    }
  }
}

output "policy_initiatives" {
  description = "Map of all policy initiatives created."
  value       = azurerm_management_group_policy_set_definition.initiative
}
