targetScope = 'managementGroup'

@description('The name of the org management group.')
param orgName string

@description('The Id of the root management group.')
param rootMgId string

@description('The name of the level one management groups.')
param levelOneMg array
//param platformLevelMg array = [
//  'management'
//  'identity'
//  'connectivity'
//]
//
//param landingzonesLevelMg array = [
//  'corp'
//  'online'
//]
//
resource rootMg 'Microsoft.Management/managementGroups@2021-04-01' existing = {
  name: rootMgId
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

resource levelOneMgDeployment 'Microsoft.Management/managementGroups@2023-04-01' = [for levelOne in levelOneMg: {
  scope: tenant()
  name: levelOne
  properties: {
    details: {
      parent: {
        id: orgMgDeployment.id
      }
    }
    displayName: levelOne
  }
}]
