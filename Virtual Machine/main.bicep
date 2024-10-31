param location string = resourceGroup().location
param vmName string
param adminUsername string
@secure()
param adminPassword string

// Importing the network module
module networkModule './modules/network.bicep' = {
  name: 'networkDeployment'
  params: {
    location: location
    vnetName: '${vmName}-vnet'
    subnetName: '${vmName}-subnet'
    addressSpace: '10.0.0.0/16'
    subnetPrefix: '10.0.1.0/24'
  }
}

// Importing the NIC module
module nicModule './modules/nic.bicep' = {
  name: 'nicDeployment'
  params: {
    location: location
    nicName: '${vmName}NIC'
    subnetId: networkModule.outputs.subnetId
  }
}

// Importing the VM module
module vmModule './modules/vm.bicep' = {
  name: 'vmDeployment'
  params: {
    location: location
    vmName: vmName
    adminUsername: adminUsername
    adminPassword: adminPassword
    nicId: nicModule.outputs.nicId
  }
}

// Output the VM ID
output vmId string = vmModule.outputs.vmId
