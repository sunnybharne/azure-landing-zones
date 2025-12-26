resource "azurerm_subscription" "subscription" {
  alias             = var.alias
  subscription_name = var.alias
  subscription_id   = var.subscription_id
  workload          = var.workload
  tags              = var.tags
}

resource "azurerm_management_group_subscription_association" "mg" {
  management_group_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_id}"
  subscription_id     = "/subscriptions/${var.subscription_id}"
  depends_on          = [azurerm_subscription.subscription]
}

resource "azurerm_consumption_budget_subscription" "budget" {
  name            = "${var.alias}-budget"
  subscription_id = "/subscriptions/${var.subscription_id}"
  amount          = var.budget_amount
  time_grain      = var.budget_time_grain

  time_period {
    start_date = var.budget_start_date
    end_date   = var.budget_end_date
  }

  notification {
    enabled        = true
    threshold      = var.budget_notification_threshold
    operator       = var.budget_notification_operator
    threshold_type = var.budget_notification_threshold_type
    contact_emails = var.budget_contact_emails
  }

  depends_on = [azurerm_subscription.subscription]
}
