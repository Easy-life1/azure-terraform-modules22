Azure Container Registry terraform module
===========

A terraform module to create container registry in Azure cloud.



Module Input Variables
----------------------

- `ProjectName` - Name of the project
- `resourceGroup` - Azure Resourcegroup name
- `registrySKU` - SKU for container registry
- `containerAdminEnabled` - Azure Resourcegroup location
- `registryGeoreplication1` - First georeplication region for container registry
- `registryGeoreplication2` - Second georeplication region for container registry
- `principalID` - PrincipalID of the account 


Usage
-----

```hcl
module "demo" {
  source                  = "./modules/containerRegistry"
  resourceGroup           = var.resourceGroup
  location                = var.location
  principalID             = var.principalID
  registrySKU             = var.registrySKU
  containerAdminEnabled   = var.containerAdminEnabled
  registryGeoreplication1 = var.registryGeoreplication1
  registryGeoreplication2 = var.registryGeoreplication2

  tags {
    "Environment" = "${var.environment}"
  }
}
```


Outputs
=======

 - `name` - does what it says on the tin
 - `environment` - does what it says on the tin