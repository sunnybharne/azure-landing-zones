output "subscription_id" {
  description = "The subscription ID."
  value       = azurerm_subscription.subscription.subscription_id
}

output "subscription_alias" {
  description = "The subscription alias."
  value       = azurerm_subscription.subscription.alias
}

output "subscription_name" {
  description = "The subscription display name."
  value       = azurerm_subscription.subscription.subscription_name
}
