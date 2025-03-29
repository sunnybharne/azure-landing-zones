targetScope = 'subscription'

resource rgbicep 'Microsoft.Resources/resourceGroups@2024-11-01' = { 
  location: deployment().location
  name: 'rg-bicep'
  tags: {
    'deployed by': 'bicep'
    'owner': 'sunny bharne'
  }
}
