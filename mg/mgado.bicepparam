using './mg.bicep'

param orgName = 'papliba'

param tenantRootMgId = 'c0f414ff-9e2d-4011-929c-fe21ed71b218'

param rootChildMg = [
  'platform'
  'landingzones'
  'decommissioned' 
  'sandbox'
]

param platformChildMg = [
  'management'
  'identity'
  'connectivity'
]

param landingzonesChildMg = [
  'corp'
  'online'
]
