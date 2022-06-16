variable "resourceGroup" {
  type        = string
  description = "Azure Resourcegroup name"
  default     = "resourceGroup"
}

variable "location" {
  type        = string
  description = "Azure Resourcegroup location"
  default     = "West Europe"
}

variable "ProjectName" {
  type        = string
  description = "Azure project name"
  default     = "azure3tier"
}

variable "nodePoolType" {
  type        = string
  description = "Type of node pool"
  default     = "AvailabilitySet"
}

variable "nodePoolVMSize" {
  type        = string
  description = "Type of node pool"
  default     = "standard_d2ads_v5"
}

variable "nodePoolPublicIP" {
  type        = bool
  description = "Enable or disable node pool public ip option"
  default     = false
}

variable "nodePoolAutoScaling" {
  type        = bool
  description = "Enable or disable node pool auto scaling"
  default     = false
}

variable "nodePoolOSDiskSize" {
  type        = number
  default     = 30
  description = "Root disk size for nodes"
}

variable "nodeCount" {
  type        = number
  default     = 1
  description = "Number of nodes in node pool"
}

variable "networkPlugin" {
  type        = string
  description = "Type of network plugin"
  default     = "azure"
}

variable "networkPolicy" {
  type        = string
  description = "Type of network policy"
  default     = "azure"
}

variable "loadBalancerSKU" {
  type        = string
  description = "Type of load balancer SKU"
  default     = "standard"
}

variable "serviceCIDR" {
  type        = string
  description = "service CIDR"
  default     = "172.0.0.0/16"
}

variable "dockerBridgeCIDR" {
  type        = string
  description = "Docker Bridge CIDR"
  default     = "192.0.0.0/24"
}

variable "dnsServiceIP" {
  type        = string
  description = "IP for dns service in cluster"
  default     = "172.0.1.1"
}

variable "client_id" {
  type        = string
  description = "Service principal client id for access to k8s cluster"
  default     = "fa6c33d1-03dd-4226-8c19-e84bfdc824cc"
}

variable "client_secret" {
  type        = string
  description = "Service principal client secret for access to k8s cluster"
  default     = "XmJ8Q~GYOYMNm4NuXJ2GxhnPQn_6RbijO54DYad."
}