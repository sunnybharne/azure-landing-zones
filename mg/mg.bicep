targetScope = 'managementGroup'

@description('The name of the org management group.')
param orgName string

@description('The Id of the root management group.')
param tenantRootMgId string

@description('Child management groups of the root management group.')
param rootChildMg object

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

resource rootChildMgDeployment 'Microsoft.Management/managementGroups@2023-04-01' = [for child in items(rootChildMg): {
    scope: tenant()
    name: child.value.name
    properties: {
      details: {
        parent: {
          id: orgMgDeployment.id
        }
      }
      displayName: child.value.name
    }
}]

resource platformChildMgDeployment 'Microsoft.Management/managementGroups@2023-04-01' = [for child in items(rootChildMg.platformMg.childMg): {
    scope: tenant()
    name: child.value.name
    properties: {
      details: {
        parent: {
          id: '/providers/Microsoft.Management/managementGroups/${rootChildMg.platformMg.name}'
        }
      }
      displayName: child.value.name
    }
}]

resource landingzonesMgDeployment 'Microsoft.Management/managementGroups@2023-04-01' = [for child in items(rootChildMg.landingzonesMg.childMg): {
    scope: tenant()
    name: child.value.name
    properties: {
      details: {
        parent: {
          id: '/providers/Microsoft.Management/managementGroups/${rootChildMg.landingzonesMg.name}'
        }
      }
      displayName: child.value.name
    }
}]
