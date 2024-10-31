param location string
param vnetName string
param subnetName string
param addressSpace string
param subnetPrefix string

// Virtual Network Resource
resource vnet 'Microsoft.Network/virtualNetworks@2021-02-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [addressSpace]
    }
    subnets: [
      {
        name: subnetName
        properties: {
          addressPrefix: subnetPrefix
        }
      }
    ]
  }
}

// Output the Subnet ID
output subnetId string = vnet.properties.subnets[0].id
