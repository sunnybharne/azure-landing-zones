targetScope = 'managementGroup'

resource mg_root_bicep 'Microsoft.Management/managementGroups@2023-04-01' = {
  scope: tenant()
  name: 'mg_root_bicep'
  properties: {
    displayName: 'mg_root_bicep'
  }
}

param topLevelMgArray array = [
  'dev',
  'test'
  'prod'
]

resource topLevel 'Microsoft.Management/managementGroups@2023-04-01' = [for mg in topLevelMgArray : {
  scope: tenant()
  name: '${mg}'
  displayName: '${mg}'
  properties: {
    details: {
      parent: {
        id: '/providers/Microsoft.Management/managementGroups/mg_root_bicep'
      }
    }
  }
  dependsOn: [ 
    mg_root_bicep
  ]
}]


