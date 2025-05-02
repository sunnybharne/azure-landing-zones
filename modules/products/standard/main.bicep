targetScope = 'managementGroup'

@description('Subscription name to be used for the alias')
param subscriptionName string

@description('Management group ID to be used for the subscription')
param managementGroupId string

@description('Billing scope to be used for the subscription')
param billingScope string

@description('workload name to be used for the subscription')
param workload string

@description('Subscription tags')
param tags object

@description('The name of the subscription to create')
//module subscription '../../services/papliba.subscription.bicep' = {
module subscription '../../services/papliba.subscription.bicep' = {
  name: subscriptionName
  params: {
    subscriptionName: subscriptionName
    managementGroupId: managementGroupId
    billingScope: billingScope
    workload: workload
    tags: tags
  }
}
