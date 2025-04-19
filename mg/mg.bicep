targetScope = 'managementGroup'

@description('The name of the org management group.')
param tenantRootMgId string

@description('Management group structure')
param orgMg string 
param platformMG string 
param managementMG string 
param identityMG string 
param connectivityMG string 
param landingzonesMG string 
param corpMG string 
param onlineMG string 
param decommissionedMG string 
param sandboxMG string 

resource rootMg 'Microsoft.Management/managementGroups@2021-04-01' existing = {
  name: tenantRootMgId
  scope: tenant()
}

resource orgMgDeployment 'Microsoft.Management/managementGroups@2023-04-01' = {
  scope: tenant()
  name: orgMg
  properties: {
    details: {
      parent: {
        id: rootMg.id
      }
    }
    displayName: orgMg
  }
}

resource platformMgDeployment 'Microsoft.Management/managementGroups@2023-04-01' = {
  scope: tenant()
  name: platformMG
  properties: {
    details: {
      parent: {
        id: orgMgDeployment.id
      }
    }
    displayName: platformMG
  }
}

resource landingzonesMgDeployment 'Microsoft.Management/managementGroups@2023-04-01' = {
  scope: tenant()
  name: landingzonesMG
  properties: {
    details: {
      parent: {
        id: orgMgDeployment.id
      }
    }
    displayName: landingzonesMG
  }
}

resource decommissionedMgDeployment 'Microsoft.Management/managementGroups@2023-04-01' = {
  scope: tenant()
  name: decommissionedMG
  properties: {
    details: {
      parent: {
        id: orgMgDeployment.id
      }
    }
    displayName: decommissionedMG
  }
}

resource sandboxMgDeployment 'Microsoft.Management/managementGroups@2023-04-01' = {
  scope: tenant()
  name: sandboxMG
  properties: {
    details: {
      parent: {
        id: orgMgDeployment.id
      }
    }
    displayName: sandboxMG
  }
}

resource managementMgDeployment 'Microsoft.Management/managementGroups@2023-04-01' = {
  scope: tenant()
  name: managementMG
  properties: {
    details: {
      parent: {
        id: platformMgDeployment.id
      }
    }
    displayName: managementMG
  }
}

resource identityMgDeployment 'Microsoft.Management/managementGroups@2023-04-01' = {
  scope: tenant()
  name: identityMG
  properties: {
    details: {
      parent: {
        id: platformMgDeployment.id
      }
    }
    displayName: identityMG
  }
}

resource connectivityMgDeployment 'Microsoft.Management/managementGroups@2023-04-01' = {
  scope: tenant()
  name: connectivityMG
  properties: {
    details: {
      parent: {
        id: platformMgDeployment.id
      }
    }
    displayName: connectivityMG
  }
}

resource corpMgDeployment 'Microsoft.Management/managementGroups@2023-04-01' = {
  scope: tenant()
  name: corpMG
  properties: {
    details: {
      parent: {
        id: landingzonesMgDeployment.id
      }
    }
    displayName: corpMG
  }
}

resource onlineMgDeployment 'Microsoft.Management/managementGroups@2023-04-01' = {
  scope: tenant()
  name: onlineMG
  properties: {
    details: {
      parent: {
        id: landingzonesMgDeployment.id
      }
    }
    displayName: onlineMG
  }
}

output orgMgId string = orgMgDeployment.id

