Azure Kubernetes Terraform Module
===========

A terraform module to create Azure Kubernetes Service


Module Input Variables
----------------------

- `resourceGroup` - Azure Resourcegroup name
- `location` - Azure Resourcegroup location
- `nodePoolType` - Type of node pool for the kubernetes cluster
- `nodePoolVMSize` - Type of virtual machine to be used in kubernetes cluster
- `nodePoolPublicIP` - Enable or disable node pool public ip option
- `nodePoolAutoScaling` - Enable or disable node pool auto scaling
- `nodePoolOSDiskSize` - Root disk size for nodes
- `nodeCount` - Number of nodes in node pool
- `networkPlugin` - Type of network plugin
- `networkPolicy` - Type of network policy
- `loadBalancerSKU` - Type of load balancer SKU
- `serviceCIDR` - Kubernetes service CIDR
- `dockerBridgeCIDR` - Docker Bridge CIDR
- `dnsServiceIP` - IP for dns service in cluster
- `client_id` - Service principal client id for access to k8s cluster
- `client_secret` - Service principal client secret for access to k8s cluster

Usage
-----

```hcl
module "demo" {
  source = "github.com/my-repo/demo"

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

  tags {
    "Environment" = "${var.environment}"
  }
}
```
