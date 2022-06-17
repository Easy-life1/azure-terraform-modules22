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


resource "azurerm_kubernetes_cluster" "k8s" {
  name                = var.ProjectName
  location            = var.location
  resource_group_name = var.resourceGroup # th RG the single cluster entity goes is
  dns_prefix          = var.ProjectName
  node_resource_group = "K8S${azurerm_resource_group.resourceGroup.name}" #  all the k8s' entities must be in fdifferent RG than where the cluster object itself is
  #enable_pod_security_policy      = true


  default_node_pool {
    name                  = var.ProjectName
    type                  = var.nodePoolType
    vm_size               = var.nodePoolVMSize
    enable_node_public_ip = var.nodePoolPublicIP
    enable_auto_scaling   = var.nodePoolAutoScaling
    os_disk_size_gb       = var.nodePoolOSDiskSize
    node_count            = var.nodeCount
    #    vnet_subnet_id        = azurerm_subnet.subnet2.id
  }


  network_profile {
    network_plugin     = var.networkPlugin
    network_policy     = var.networkPolicy
    load_balancer_sku  = var.loadBalancerSKU
    service_cidr       = var.serviceCIDR
    docker_bridge_cidr = var.dockerBridgeCIDR
    dns_service_ip     = var.dnsServiceIP
  }

  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }

}

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.k8s.kube_config.0.client_certificate
  sensitive = true
}

output "kube_config" {
  value     = azurerm_kubernetes_cluster.k8s.kube_config_raw
  sensitive = true
}