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

resource "azurerm_management_group_policy_assignment" "assignment" {
  for_each             = local.files_maps
  name                 = each.value.name
  display_name         = each.value.displayName
  description          = each.value.description
  metadata             = jsonencode(each.value.metadata)
  location             = each.value.location
  enforce              = each.value.enforce
  management_group_id  = "/providers/Microsoft.Management/managementGroups/${split("/", each.key)[0]}"
  policy_definition_id = each.value.policyDefinitionId
  parameters           = jsonencode(each.value.parameters)
  not_scopes           = each.value.notScopes

  dynamic "non_compliance_message" {
    for_each = each.value.nonComplianceMessage
    content {
      content                        = non_compliance_message.value.content
      policy_definition_reference_id = non_compliance_message.value.policyDefinitionReferenceId
    }
  }

  identity {
    type         = each.value.identity.type
    identity_ids = each.value.identity.identity_ids
  }
}

output "policy_assignments" {
  description = "Map of all policy assignments created."
  value       = azurerm_management_group_policy_assignment.assignment
}
