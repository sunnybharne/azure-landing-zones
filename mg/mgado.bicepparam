using './mg.bicep'

param orgName = 'papliba'

param tenantRootMgId = 'c0f414ff-9e2d-4011-929c-fe21ed71b218'

param rootChildMg = {
  platformMg:{
    name: 'platform'
    childMg: {
      management: {
        name: 'management'
      }
      identity: {
        name: 'identity'
      }
      connectivity: {
        name: 'connectivity'
      }
    }
  }
  landingzonesMg: {
    name: 'landingzones'
    childMg: {
      corp: {
        name: 'corp'
      }
      online: {
        name: 'online'
      }
    }
  }
  decommissionedMg: {
    name: 'decommissioned'
  }
  sandboxMg: {
    name: 'sandbox'
  }
}
