using './main.bicep'

@description('Subscription name to be used for the alias')
param subscriptionName = 'papliba-platform-prod-01'

@description('Management group ID to be used for the subscription')
param managementGroupId = 'management'

@description('Billing scope to be used for the subscription')
param billingScope = '/providers/Microsoft.Billing/billingAccounts/6a96a13c-1f1c-5d50-b183-7c11b761cb50:77f3f15a-54f6-4f94-a3db-3a14ef57c4cf_2019-05-31/billingProfiles/PX77-MIG5-BG7-PGB' 

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
