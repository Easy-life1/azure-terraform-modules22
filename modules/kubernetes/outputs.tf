output "kubernetes_cluster_identity" {
  value = azurerm_kubernetes_cluster.k8s.kubelet_identity
}