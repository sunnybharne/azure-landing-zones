targetScope = 'managementGroup'

param rootmg string = 'root_actions_bicep'

param topLevelMgArray array = [
  'dev'
  'test'
  'prod'
]

param midLevelMgArray array = [
  'decommissioned'
  'landingzone'
  'platform'
  'sandbox'
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

resource midDevLevel 'Microsoft.Management/managementGroups@2023-04-01' = [for mgmidlevel in midLevelMgArray : {
    scope: tenant()
    name: '${mgmidlevel}-dev'
    properties: {
      displayName: '${mgmidlevel}-dev'
      details: {
        parent: {
          id: '/providers/Microsoft.Management/managementGroups/dev'
        }
      }
    }
    dependsOn: [ 
      topLevel
    ]
 }]

resource midTestLevel 'Microsoft.Management/managementGroups@2023-04-01' = [for mgmidlevel in midLevelMgArray : {
    scope: tenant()
    name: '${mgmidlevel}-test'
    properties: {
      displayName: '${mgmidlevel}-test'
      details: {
        parent: {
          id: '/providers/Microsoft.Management/managementGroups/test'
        }
      }
    }
    dependsOn: [ 
      topLevel
    ]
 }]

resource midProdLevel 'Microsoft.Management/managementGroups@2023-04-01' = [for mgmidlevel in midLevelMgArray : {
    scope: tenant()
    name: '${mgmidlevel}-prod'
    properties: {
      displayName: '${mgmidlevel}-prod'
      details: {
        parent: {
          id: '/providers/Microsoft.Management/managementGroups/prod'
        }
      }
    }
    dependsOn: [ 
      topLevel
    ]
 }]
