module "networking" {
  source           = "./modules/networking"
  resourceGroup    = var.resourceGroup
  location         = var.location
  vnetAddressSpace = var.vnetAddressSpace
  dnsServerAddress = var.dnsServerAddress
  subnet1CIDR      = var.subnet1CIDR
  subnet2CIDR      = var.subnet2CIDR
  subnet3CIDR      = var.subnet3CIDR
}

module "kubernetes" {
  source              = "./modules/kubernetes"
  resourceGroup       = var.resourceGroup
  location            = var.location
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
  resourceGroup           = var.resourceGroup
  location                = var.location
  principalID             = var.principalID
  registrySKU             = var.registrySKU
  containerAdminEnabled   = var.containerAdminEnabled
  registryGeoreplication1 = var.registryGeoreplication1
  registryGeoreplication2 = var.registryGeoreplication2
}