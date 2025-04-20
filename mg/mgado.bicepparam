using './main.bicep'

@description('The name of the org management group.')
param tenantRoot = 'c0f414ff-9e2d-4011-929c-fe21ed71b218'

@description('Management group structure')
param org = 'papliba'
param platform = 'platform'
param management = 'management'
param identity = 'identity'
param connectivity = 'connectivity'
param landingzones = 'landingzones'
param corp = 'corp'
param online = 'online'
param decommissioned = 'decommissioned'
param sandbox = 'sandbox'
