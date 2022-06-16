variable "resourceGroup" {
    type = string
    description = "Azure Resourcegroup name"
    default = "resourceGroup"
}

variable "location" {
    type = string
    description = "Azure Resourcegroup location"
    default = "West Europe"
}

variable "ProjectName" {
    type = string
    description = "Azure project name"
    default = "Azure3tier"
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