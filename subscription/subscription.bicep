targetScope = 'managementGroup'

param subscriptionName string

param managementGroupId string 

resource symbolicname 'Microsoft.Subscription/aliases@2024-08-01-preview' = {
  scope: tenant()
  name: subscriptionName
  properties: {
    additionalProperties: {
      managementGroupId: managementGroupId
    }
    billingScope: '/providers/Microsoft.Billing/billingAccounts/7ddbc21b-d605-48b1-be46-787a0eb84b1e'
    displayName: subscriptionName
    workload: 'production'
  }
}


