using './main.bicep'

@description('subscription name to be used for the alias')
param subscriptionname = 'papliba-platform-prod-01'

@description('management group id to be used for the subscription')
param managementgroupid = '/providers/microsoft.management/managementgroups/management'

@description('billing scope to be used for the subscription')
param billingscope = '/providers/microsoft.billing/billingaccounts/6a96a13c-1f1c-5d50-b183-7c11b761cb50:77f3f15a-54f6-4f94-a3db-3a14ef57c4cf_2019-05-31/billingprofiles/ceba4489-fa5a-4feb-a719-a5623f1a76e2/invoicesections/rts7-cnp5-pja-pgb' 

@description('workload name to be used for the subscription')
param workload = 'production'

@description('subscription tags')
param tags = {
  environment : 'prod'
  costcenter : 'papliba'
  owner : 'sunny.bharne@outlook.com'
  project : 'papliba'
  product : 'papliba'
  team : 'clz'
}
