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

module mgStructure '../../services/papliba.mg.structure.bicep' = {
    name: 'mgStructure'
    params: {
      tenantRoot: tenantRoot
      org: org
      platform: platform
      management: management
      identity: identity
      connectivity: connectivity
      landingzones: landingzones
      corp: corp
      online: online
      decommissioned: decommissioned
      sandbox: sandbox
      suffix: ''
  }
}

module mgStructureCanary '../../services/papliba.mg.structure.bicep' = {
    name: 'mgStructureCanary'
    params: {
      tenantRoot: tenantRoot
      org: org
      platform: platform
      management: management
      identity: identity
      connectivity: connectivity
      landingzones: landingzones
      corp: corp
      online: online
      decommissioned: decommissioned
      sandbox: sandbox
      suffix: '-canary'
  }
}
