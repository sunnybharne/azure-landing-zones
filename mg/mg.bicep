targetScope = 'managementGroup'

param rootmg string = 'root_actions_bicep'

param topLevelMgArray array = [
  'dev'
  'test'
  'prod'
]

resource root 'Microsoft.Management/managementGroups@2023-04-01' = {
  scope: tenant()
  name: rootmg
  properties: {
    displayName: rootmg
  }
}

resource topLevel 'Microsoft.Management/managementGroups@2023-04-01' = [for mg in topLevelMgArray : {
  scope: tenant()
  name: '${mg}'
  properties: {
    displayName: '${mg}'
    details: {
      parent: {
        id: '/providers/Microsoft.Management/managementGroups/${rootmg}'
      }
    }
  }
  dependsOn: [ 
    root
  ]
}]
