targetScope = 'managementGroup'

@description('The name of the org management group.')
param tenantRoot string

@description('Management group structure')
param org string 
param platform string 
param management string 
param identity string 
param connectivity string 
param landingzones string 
param corp string 
param online string 
param decommissioned string 
param sandbox string 

@description('suffix to be appended to the management group names')
param suffix string

var orgMg = '${org}${suffix}'
var platformMG = '${platform}${suffix}'
var managementMG = '${management}${suffix}'
var identityMG = '${identity}${suffix}'
var connectivityMG = '${connectivity}${suffix}'
var landingzonesMG = '${landingzones}${suffix}'
var corpMG = '${corp}${suffix}'
var onlineMG = '${online}${suffix}'
var decommissionedMG = '${decommissioned}${suffix}'
var sandboxMG = '${sandbox}${suffix}'

resource rootMg 'Microsoft.Management/managementGroups@2021-04-01' existing = {
  name: tenantRoot
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
