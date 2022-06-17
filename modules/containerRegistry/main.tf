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

resource "azurerm_container_registry" "acr" {
  name                = var.ProjectName
  resource_group_name = var.resourceGroup
  location            = var.location
  sku                 = var.registrySKU
  admin_enabled       = var.containerAdminEnabled
  georeplications {
    location                = var.registryGeoreplication1
    zone_redundancy_enabled = true
    tags                    = {}
  }
  georeplications {
    location                = var.registryGeoreplication2
    zone_redundancy_enabled = true
    tags                    = {}
  }
}

resource "azurerm_role_assignment" "roleassign" {
  principal_id                     = var.principalID
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.acr.id
  skip_service_principal_aad_check = true
}