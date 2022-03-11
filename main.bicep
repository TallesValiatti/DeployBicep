// az deployment sub create --template-file Infra/main.bicep --location centralus

// Scope
targetScope = 'subscription'

// Shared variables
param location string = deployment().location

// Resource group variables
var rgName = 'rg-deploy-bicep'

// Resource group
resource rg 'Microsoft.Resources/resourceGroups@2020-10-01' = {
  location: location
  name: rgName
}
