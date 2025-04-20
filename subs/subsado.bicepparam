using './main.bicep'

@description('Subscription name to be used for the alias')
param subscriptionName = 'papliba-platform-prod-01'

@description('Management group ID to be used for the subscription')
param managementGroupId = 'management'

@description('Billing scope to be used for the subscription')
param billingScope = '/providers/Microsoft.Billing/billingAccounts/7ddbc21b-d605-48b1-be46-787a0eb84b1e' 

@description('workload name to be used for the subscription')
param workload = 'production'

@description('Subscription tags')
param tags = {
  environment : 'prod'
  costCenter : 'papliba'
  owner : 'sunny.bharne@outlook.com'
  project : 'papliba'
  product : 'papliba'
  team : 'clz'
}
