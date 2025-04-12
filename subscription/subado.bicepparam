using './subscription.bicep'

@description('Subscription display name')
param subscriptionDisplayName  = 'papliba-platform-prod-01'

@description('workload type for the subscription')
param subscriptionWorkload = 'Production'

@description('BillingScope used for subscription billing')
param billingScope = '/providers/Microsoft.Billing/billingAccounts/7ddbc21b-d605-48b1-be46-787a0eb84b1e'

@description('Tags to be applied to the subscription')
param tags = {
  tag1 : 'value1'
  tag2 : 'value2'
  tag3 : 'value3'
}

@description('Management group to which the subscription will be assigned')
param mgmtGroup = '/providers/Microsoft.Management/managementGroups/root_actions_bicep'
