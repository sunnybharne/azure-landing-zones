targetScope = 'subscription'

resource symbolicname 'Microsoft.Subscription/aliases@2024-08-01-preview' = {
  scope: tenant()
  name: 'platform-dev-01'
}
