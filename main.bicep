// az deployment sub create --template-file Infra/main.bicep --location centralus

// Parameters
param rgName string

// Scope
targetScope = 'subscription'

// Shared variables
param location string = deployment().location

// Resource group variables
var rgFullName = 'rg-${rgName}-${location}'

// Resource group
resource rg 'Microsoft.Resources/resourceGroups@2020-10-01' = {
  location: location
  name: rgFullName
}
