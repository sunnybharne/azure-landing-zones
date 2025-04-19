using './mg.bicep'

@description('The name of the org management group.')
param tenantRootMgId = 'c0f414ff-9e2d-4011-929c-fe21ed71b218'

@description('Management group structure')
param orgMg = 'papliba'
param platformMG = 'platform'
param managementMG = 'management'
param identityMG = 'identity'
param connectivityMG = 'connectivity'
param landingzonesMG = 'landingzones'
param corpMG = 'corp'
param onlineMG = 'online'
param decommissionedMG = 'decommissioned'
param sandboxMG = 'sandbox'

