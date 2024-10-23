// main.bicep
targetScope = 'subscription'

@description('The name of the resource group')
param resourceGroupName string

@description('The location for the resource group')
param location string

resource myResourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resourceGroupName
  location: location
}
