targetScope = 'tenant'

resource bicepmg 'Microsoft.Management/managementGroups@2023-04-01' = { 
  scope: tenant()
  name: 'bicepmg'
  properties: {
  details: {
        parent: {
          id: 'papliba'
        }
      }
  displayName: 'bicepmg'
  }

}
