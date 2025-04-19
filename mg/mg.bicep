targetScope = 'managementGroup'

@description('The name of the org management group.')
param orgName string

@description('The Id of the root management group.')
param tenantRootMgId string

@description('Child management groups of the root management group.')
param rootChildMg object

var canaryOrg = [
  orgName
  '${orgName}-canary'
]

module mg '../modules/papliba.mg.structure.bicep' = {
  name: 'mg-deployment'
  params: {
    orgName: orgName
    tenantRootMgId: tenantRootMgId
    rootChildMg: rootChildMg
  }
}
