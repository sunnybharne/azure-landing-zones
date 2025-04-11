targetScope = 'managementGroup'

param rootmg string

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

param landingZones array = [
  'online'
  'corp'
]

param platform array = [
  'management'
  'identity'
  'connectivity'
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

resource landingZoneDev 'Microsoft.Management/managementGroups@2023-04-01' = [for landingzonemg in landingZones : {
    scope: tenant()
    name: '${landingzonemg}-dev'
    properties: {
      displayName: '${landingzonemg}-dev'
      details: {
        parent: {
          id: '/providers/Microsoft.Management/managementGroups/landingzone-dev'
        }
      }
    }
    dependsOn: [ 
      midDevLevel
    ]
 }]

resource landingZoneTest 'Microsoft.Management/managementGroups@2023-04-01' = [for landingzonemg in landingZones : {
    scope: tenant()
    name: '${landingzonemg}-test'
    properties: {
      displayName: '${landingzonemg}-test'
      details: {
        parent: {
          id: '/providers/Microsoft.Management/managementGroups/landingzone-test'
        }
      }
    }
    dependsOn: [ 
      midTestLevel
    ]
 }]

resource landingZoneProd 'Microsoft.Management/managementGroups@2023-04-01' = [for landingzonemg in landingZones : {
    scope: tenant()
    name: '${landingzonemg}-prod'
    properties: {
      displayName: '${landingzonemg}-prod'
      details: {
        parent: {
          id: '/providers/Microsoft.Management/managementGroups/landingzone-prod'
        }
      }
    }
    dependsOn: [ 
      midProdLevel
    ]
 }]
