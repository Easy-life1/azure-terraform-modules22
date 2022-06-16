variable "resourceGroup" {
  type        = string
  description = "Azure Resourcegroup name"
  default     = "resourceGroup"
}

variable "ProjectName" {
  type        = string
  description = "Azure project name"
  default     = "azure3tier"
}

variable "location" {
  type        = string
  description = "Azure Resourcegroup location"
  default     = "West Europe"
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

variable "principalID" {
  description = "Georeplication region for container registry"
}