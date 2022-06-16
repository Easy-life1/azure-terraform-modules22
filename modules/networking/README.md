Azure Networking Terraform Module
===========

A terraform module to provide 3 tier networking setup on Azure Cloud

This module creates the following resources
* Vnet based on user provided CIDR
* NAT Gateway
* Network Security Group
* Network Security Rules
* 3 Subnets - 1Private , 1 using NAT Gateway and 1 having firewall
* Firewall
* Public IP to be used by firewall

Module Input Variables
----------------------

- `resourceGroup` - Azure Resourcegroup name
- `location` - Azure Resourcegroup location
- `ProjectName` - Name of the project these resources are part of
- `vnetAddressSpace` - CIDR range for creating vNet
- `dnsServerAddress` - DNS server address. Should fall within the vNet CIDR
- `subnet1CIDR` - CIDR for first subnet . Should fall within the vNet
- `subnet2CIDR` - CIDR for second subnet . Should fall within the vNet
- `subnet3CIDR` - CIDR for third subnet . Should fall within the vNet

Usage
-----

```hcl
module "demo" {
  source = "./module/networking"

  resourceGroup    = var.resourceGroup
  location         = var.location
  vnetAddressSpace = var.vnetAddressSpace
  dnsServerAddress = var.dnsServerAddress
  subnet1CIDR      = var.subnet1CIDR
  subnet2CIDR      = var.subnet2CIDR
  subnet3CIDR      = var.subnet3CIDR

  tags {
    "Environment" = "${var.environment}"
  }
}
```


