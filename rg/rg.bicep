targetScope = 'subscription'

resource rgbicep 'Microsoft.Resources/resourceGroups@2024-11-01' = { 
  location: deployment().location
  name: 'rg-bicep'
  tags: {
    'deployed by': 'bicep'
    'owner': 'sunny bharne'
  }
}

resource rgbiceptest 'Microsoft.Resources/resourceGroups@2024-11-01' = { 
  location: deployment().location
  name: 'rg-bicep-test'
  tags: {
    'deployed by': 'bicep'
    'owner': 'sunny bharne'
  }
}

resource rgbiceptest1 'Microsoft.Resources/resourceGroups@2024-11-01' = { 
  location: deployment().location
  name: 'rg-bicep-test1'
  tags: {
    'deployed by': 'bicep'
    'owner': 'sunny bharne'
  }
}
