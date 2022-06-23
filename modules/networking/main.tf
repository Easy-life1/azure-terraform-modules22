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

resource "azurerm_network_security_group" "securityGroup" {
  name                = "securityGroup"
  location            = var.location
  resource_group_name = var.resourceGroup
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
  resource_group_name         = var.resourceGroup
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
  resource_group_name         = var.resourceGroup
  network_security_group_name = azurerm_network_security_group.securityGroup.name
}

resource "azurerm_virtual_network" "vNet" {
  name                = "vNet"
  location            = var.location
  resource_group_name = var.resourceGroup
  address_space       = var.vnetAddressSpace
  dns_servers         = var.dnsServerAddress

  tags = {
    environment = "Production"
  }
}

resource "azurerm_subnet" "subnet1" {
  name                 = "subnet1"
  resource_group_name  = var.resourceGroup
  virtual_network_name = azurerm_virtual_network.vNet.name
  address_prefixes     = var.subnet1CIDR
}

resource "azurerm_subnet" "subnet2" {
  name                 = "subnet2"
  resource_group_name  = var.resourceGroup
  virtual_network_name = azurerm_virtual_network.vNet.name
  address_prefixes     = var.subnet2CIDR
}

resource "azurerm_network_interface" "networkInterface" {
  name                = "networkInterface"
  location            = var.location
  resource_group_name = var.resourceGroup

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
  location            = var.location
  resource_group_name = var.resourceGroup
}

resource "azurerm_subnet_nat_gateway_association" "natGatewayAss" {
  subnet_id      = azurerm_subnet.subnet2.id
  nat_gateway_id = azurerm_nat_gateway.natGateway.id
}

resource "azurerm_subnet" "subnet3" {
  name                 = "AzureFirewallSubnet"
  resource_group_name  = var.resourceGroup
  virtual_network_name = azurerm_virtual_network.vNet.name
  address_prefixes     = var.subnet3CIDR
}

resource "azurerm_public_ip" "publicIp" {
  name                = "publicIp"
  location            = var.location
  resource_group_name = var.resourceGroup
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_firewall" "fireWall" {
  name                = "fireWall"
  location            = var.location
  resource_group_name = var.resourceGroup
  sku_name            = "AZFW_VNet"
  sku_tier            = "Standard"
  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.subnet3.id
    public_ip_address_id = azurerm_public_ip.publicIp.id
  }
}