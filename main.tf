terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "resourceGroup" {
  name     = var.resourceGroup
  location = var.location
}



module "networking" {
  source           = "./modules/networking"
  resourceGroup    = azurerm_resource_group.resourceGroup.name
  location         = azurerm_resource_group.resourceGroup.location
  vnetAddressSpace = var.vnetAddressSpace
  dnsServerAddress = var.dnsServerAddress
  subnet1CIDR      = var.subnet1CIDR
  subnet2CIDR      = var.subnet2CIDR
  subnet3CIDR      = var.subnet3CIDR

}

module "kubernetes" {
  source              = "./modules/kubernetes"
  resourceGroup       = azurerm_resource_group.resourceGroup.name
  location            = azurerm_resource_group.resourceGroup.location
  ProjectName         = var.ProjectName
  nodePoolType        = var.nodePoolType
  nodePoolVMSize      = var.nodePoolVMSize
  nodePoolPublicIP    = var.nodePoolPublicIP
  nodePoolAutoScaling = var.nodePoolAutoScaling
  nodePoolOSDiskSize  = var.nodePoolOSDiskSize
  nodeCount           = var.nodeCount
  networkPlugin       = var.networkPlugin
  networkPolicy       = var.networkPolicy
  loadBalancerSKU     = var.loadBalancerSKU
  serviceCIDR         = var.serviceCIDR
  dockerBridgeCIDR    = var.dockerBridgeCIDR
  dnsServiceIP        = var.dnsServiceIP
  client_id           = var.client_id
  client_secret       = var.client_secret

}

module "containerRegistry" {
  source                  = "./modules/containerRegistry"
  resourceGroup           = azurerm_resource_group.resourceGroup.name
  location                = azurerm_resource_group.resourceGroup.location
  principalID             = var.principalID
  registrySKU             = var.registrySKU
  containerAdminEnabled   = var.containerAdminEnabled
  registryGeoreplication1 = var.registryGeoreplication1
  registryGeoreplication2 = var.registryGeoreplication2

}