targetScope = 'managementGroup'

@description('The name of the org management group.')
param orgName string

@description('The Id of the root management group.')
param tenantRootMgId string

@description('Child management groups of the root management group.')
param rootChildMg array

@description('Child management groups of the platform management group.')
param platformChildMg array

@description('Child management groups of the landingzones management group.') 
param landingzonesChildMg array

resource rootMg 'Microsoft.Management/managementGroups@2021-04-01' existing = {
  name: tenantRootMgId
  scope: tenant()
}

resource orgMgDeployment 'Microsoft.Management/managementGroups@2023-04-01' = {
  scope: tenant()
  name: orgName
  properties: {
    details: {
      parent: {
        id: rootMg.id
      }
    }
    displayName: orgName
  }
}

resource orgMg 'Microsoft.Management/managementGroups@2021-04-01' existing = {
  name: orgMgDeployment.id
  scope: tenant()
}

resource rootChildMgDeployment 'Microsoft.Management/managementGroups@2023-04-01' = [for child in rootChildMg: {
  scope: tenant()
  name: child
  properties: {
    details: {
      parent: {
        id: orgMg.id
      }
    }
    displayName: child
  }
}]

resource platformMg 'Microsoft.Management/managementGroups@2021-04-01' existing = {
  name: 'platform'
  scope: tenant()
  dependsOn: [
    orgMgDeployment
  ]
}

resource landingzonesMg 'Microsoft.Management/managementGroups@2021-04-01' existing = {
  name: 'landingzones'
  scope: tenant()
  dependsOn: [
    orgMgDeployment
  ]
}

resource platformChildMgDeployment 'Microsoft.Management/managementGroups@2023-04-01' = [for child in platformChildMg: {
  scope: tenant()
  name: child
  properties: {
    details: {
      parent: {
        id: platformMg.id
      }
    }
    displayName: child
  }
}]

resource landingzonesChildMgDeployment 'Microsoft.Management/managementGroups@2023-04-01' = [for child in landingzonesChildMg: {
  scope: tenant()
  name: child
  properties: {
    details: {
      parent: {
        id: landingzonesMg.id
      }
    }
    displayName: child
  }
}]
