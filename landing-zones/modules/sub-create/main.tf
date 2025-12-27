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
  files      = fileset(path.module, "../../plb/**/*.json")
  files_maps = { for x in local.files : "alias-${x}" => jsondecode(file(x)) }
}

module "subscription" {
  source          = "./module"
  for_each        = local.files_maps
  alias           = each.value.name
  subscription_id = each.value.subscriptionId
  # workload                           = each.value.workload
  tags                               = each.value.tags
  management_group_id                = each.value.managementGroupId
  budget_amount                      = each.value.budgetAmount
  budget_time_grain                  = each.value.budgetTimeGrain
  budget_start_date                  = each.value.budgetStartDate
  budget_end_date                    = each.value.budgetEndDate
  budget_notification_threshold      = each.value.budgetNotificationThreshold
  budget_notification_operator       = each.value.budgetNotificationOperator
  budget_notification_threshold_type = each.value.budgetNotificationThresholdType
  budget_contact_emails              = each.value.budgetContactEmails
}

output "subscriptions" {
  description = "Map of all landing zone subscriptions created."
  value       = module.subscription
}

output "files_maps" {
  value = local.files_maps
}
