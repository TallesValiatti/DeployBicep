// Scope
targetScope = 'subscription'

// Not Used Param
param notUsedParam string

// Shared Params
param location string = deployment().location
param resourceGroupName string
param workflowEnvironment string

// Storage Account Params
param storageAccountName string
param storageAccountSku string
param storageAccountKind string
param containerNames array

// Resource Group Variables
var resourceGroupFullName = 'rg-${resourceGroupName}-${workflowEnvironment}-${location}'

// Storage Account Variables
var storageAccountFullName = '${storageAccountName}${workflowEnvironment}' 

// Resource Group
resource rg 'Microsoft.Resources/resourceGroups@2020-10-01' = {
  location: location
  name: resourceGroupFullName
}

// Storage Account Module
module storageAccountModule 'Modules/storageAccountModule.bicep' = {
  name: 'storageAccountModule'
  scope: rg
  params: {
    containerNames: containerNames
    storageAccountName: storageAccountFullName
    kind: storageAccountKind
    sku: storageAccountSku
    location: location
  }  
}
