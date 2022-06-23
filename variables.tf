variable "resourceGroup" {
  type        = string
  description = "Azure Resourcegroup name"
  default     = "azureresourceGroup"
}

variable "location" {
  type        = string
  description = "Azure Resourcegroup location"
  default     = "West Europe"
}

variable "ProjectName" {
  type        = string
  description = "Azure project name"
  default     = "azure3ti"
}

variable "vnetAddressSpace" {
  description = "CIDR range for setting up vNet"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "dnsServerAddress" {
  description = "Address for DNS servers"
  type        = list(string)
  default     = ["10.0.0.4", "10.0.0.5"]
}

variable "subnet1CIDR" {
  description = "CIDR for subnet1"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "subnet2CIDR" {
  description = "CIDR for subnet2"
  type        = list(string)
  default     = ["10.0.2.0/24"]
}

variable "subnet3CIDR" {
  description = "CIDR for subnet3"
  type        = list(string)
  default     = ["10.0.3.0/24"]
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
  default     = "88d48044-a7b9-4b46-97ff-69fea6a1a151"
}

variable "client_secret" {
  type        = string
  description = "Service principal client secret for access to k8s cluster"
  default     = "c7b49390-4f24-41aa-80db-1bd99b212a13"
}

variable "principalID" {
  type        = string
  description = "principal id"
  default     = "37057631-1b3a-40de-bbf3-3f5f2b6ee2cc"
}

variable "registrySKU" {
  type        = string
  description = "sku for container registry"
  default     = "Premium"
}

variable "containerAdminEnabled" {
  type        = bool
  description = "Enable or disable admin for container registry"
  default     = false
}

variable "registryGeoreplication1" {
  type        = string
  description = "Georeplication region for container registry"
  default     = "East US"
}

variable "registryGeoreplication2" {
  type        = string
  description = "Georeplication region for container registry"
  default     = "East US"
}