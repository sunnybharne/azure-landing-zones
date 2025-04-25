targetScope = 'managementGroup'

@description('Management group ID to be used for the subscription')
param managementGroupId string

@description('Subscription name to be used for the alias')
param subscriptionName string

@description('Billing scope to be used for the subscription')
param billingScope string

@description('Subscription workload name')
param workload string

@description('Subscription tags')
param tags object
 
@description('Subscription deployment')
resource subscription 'Microsoft.Subscription/aliases@2024-08-01-preview' = {
  scope: tenant()
  name: subscriptionName
  properties: {
    additionalProperties: {
      managementGroupId: managementGroupId
      tags: tags
    }
    billingScope: billingScope
    displayName: subscriptionName
    workload: workload
  }
}
DimaNastya
