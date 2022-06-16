# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "resourceGroup" {
  name     = "resourceGroup"
  location = "West Europe"
}

resource "azurerm_network_security_group" "securityGroup" {
  name                = "securityGroup"
  location            = azurerm_resource_group.resourceGroup.location
  resource_group_name = azurerm_resource_group.resourceGroup.name
}

resource "azurerm_network_security_rule" "networkSecRule" {
  name                        = "test123"
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.resourceGroup.name
  network_security_group_name = azurerm_network_security_group.securityGroup.name
}

resource "azurerm_network_security_rule" "networkSecRule1" {
  name                        = "test122"
  priority                    = 101
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.resourceGroup.name
  network_security_group_name = azurerm_network_security_group.securityGroup.name
}

resource "azurerm_virtual_network" "vNet" {
  name                = "vNet"
  location            = azurerm_resource_group.resourceGroup.location
  resource_group_name = azurerm_resource_group.resourceGroup.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  tags = {
    environment = "Production"
  }
}

resource "azurerm_subnet" "subnet1" {
  name                 = "subnet1"
  resource_group_name  = azurerm_resource_group.resourceGroup.name
  virtual_network_name = azurerm_virtual_network.vNet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "subnet2" {
  name                 = "subnet2"
  resource_group_name  = azurerm_resource_group.resourceGroup.name
  virtual_network_name = azurerm_virtual_network.vNet.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "networkInterface" {
  name                = "networkInterface"
  location            = azurerm_resource_group.resourceGroup.location
  resource_group_name = azurerm_resource_group.resourceGroup.name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.subnet2.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface_security_group_association" "networkInterfaceAss" {
  network_interface_id      = azurerm_network_interface.networkInterface.id
  network_security_group_id = azurerm_network_security_group.securityGroup.id
}

resource "azurerm_nat_gateway" "natGateway" {
  name                = "natGateway"
  location            = azurerm_resource_group.resourceGroup.location
  resource_group_name = azurerm_resource_group.resourceGroup.name
}

resource "azurerm_subnet_nat_gateway_association" "natGatewayAss" {
  subnet_id      = azurerm_subnet.subnet2.id
  nat_gateway_id = azurerm_nat_gateway.natGateway.id
}

resource "azurerm_subnet" "subnet3" {
  name                 = "AzureFirewallSubnet"
  resource_group_name  = azurerm_resource_group.resourceGroup.name
  virtual_network_name = azurerm_virtual_network.vNet.name
  address_prefixes     = ["10.0.3.0/24"]
}

resource "azurerm_public_ip" "publicIp" {
  name                = "publicIp"
  location            = azurerm_resource_group.resourceGroup.location
  resource_group_name = azurerm_resource_group.resourceGroup.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_firewall" "fireWall" {
  name                = "fireWall"
  location            = azurerm_resource_group.resourceGroup.location
  resource_group_name = azurerm_resource_group.resourceGroup.name
  sku_name            = "AZFW_VNet"
  sku_tier            = "Standard"
  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.subnet3.id
    public_ip_address_id = azurerm_public_ip.publicIp.id
  }
}