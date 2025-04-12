targetScope = 'managementGroup'

@description('Billing profile used for subscription billing')
param billingScope string

@description('Display name for the subscription')
param subscriptionDisplayName string

@description('Workload type for the subscription')
param subscriptionWorkload string

@description('Tags to be applied to the subscription')
param tags object

@description('Management group to which the subscription will be assigned')
param mgmtGroup string 

resource alias 'Microsoft.Subscription/aliases@2024-08-01-preview' = {
  scope: tenant()
  name: subscriptionDisplayName
  properties: {
    additionalProperties: {
      managementGroupId: mgmtGroup
      tags: tags  
    }
    billingScope: billingScope
    displayName: subscriptionDisplayName
    workload: subscriptionWorkload
  }
}

output subscriptionId string = alias.properties.subscriptionId
