variable "alias" {
  description = "The alias name for the subscription (also used as display name)."
  type        = string
}

variable "subscription_id" {
  description = "The subscription ID (GUID)."
  type        = string
}

variable "workload" {
  description = "The workload type for the subscription."
  type        = string
}

variable "tags" {
  description = "Tags to apply to the subscription."
  type        = map(string)
}

variable "management_group_id" {
  description = "The management group ID to assign the subscription to."
  type        = string
}

variable "budget_amount" {
  description = "The budget amount in the currency of the subscription. If null, no budget will be created."
  type        = number
}

variable "budget_time_grain" {
  description = "The time grain for the budget. Possible values are Monthly, Quarterly, Annually, BillingMonth, BillingQuarter, BillingYear."
  type        = string
}

variable "budget_start_date" {
  description = "The start date for the budget in YYYY-MM-DD format. If not provided, defaults to first day of current month."
  type        = string
}

variable "budget_end_date" {
  description = "The end date for the budget in YYYY-MM-DD format. If null, budget continues until 2099-12-31 (ongoing)."
  type        = string
}

variable "budget_notification_threshold" {
  description = "The threshold value for budget notifications (percentage)."
  type        = number
}

variable "budget_notification_operator" {
  description = "The comparison operator for the notification. Possible values are EqualTo, GreaterThan, GreaterThanOrEqualTo."
  type        = string
}

variable "budget_notification_threshold_type" {
  description = "The type of threshold for the notification. Possible values are Actual, Forecasted."
  type        = string
  default     = "Actual"
}

variable "budget_contact_emails" {
  description = "List of email addresses to receive budget notifications."
  type        = list(string)
}
