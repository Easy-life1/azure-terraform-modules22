resource "azurerm_kubernetes_cluster" "k8s" {
  name                = "K8Scluster"
  location            = azurerm_resource_group.resourceGroup.location
  resource_group_name = azurerm_resource_group.resourceGroup.name # th RG the single cluster entity goes is
  dns_prefix          = "k8s"
  node_resource_group = "K8S${azurerm_resource_group.resourceGroup.name}" #  all the k8s' entities must be in fdifferent RG than where the cluster object itself is
  #enable_pod_security_policy      = true


  default_node_pool {
    name                  = "default"
    type                  = "AvailabilitySet"
    vm_size               = "standard_d2ads_v5" # Standard_DC2s_v2 Standard_B1ms
    enable_node_public_ip = false
    enable_auto_scaling   = false
    os_disk_size_gb       = 30
    node_count            = 1
#    vnet_subnet_id        = azurerm_subnet.subnet2.id
  }


  network_profile {
    network_plugin    = "azure"
    network_policy    = "azure"
    load_balancer_sku = "standard"
    service_cidr      = "172.0.0.0/16"
    docker_bridge_cidr = "192.0.0.0/24"
    dns_service_ip = "172.0.1.1" 
  }

  service_principal {
    client_id     = "fa6c33d1-03dd-4226-8c19-e84bfdc824cc"
    client_secret = "XmJ8Q~GYOYMNm4NuXJ2GxhnPQn_6RbijO54DYad."
  }

}

output "client_certificate" {
  value = azurerm_kubernetes_cluster.k8s.kube_config.0.client_certificate
  sensitive = true
}

output "kube_config" {
  value     = azurerm_kubernetes_cluster.k8s.kube_config_raw
  sensitive = true
}