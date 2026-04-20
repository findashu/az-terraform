# Business Division
variable "business_division" {
  description = "The business division for the resources."
  type        = string
  default     = "infra"
}

# Environment Variable
variable "environment" {
  description = "Environment variable used as a prefix"
  type        = string
  default     = "dev"
}

# Azure Resource Group Name
variable "resource_group_name" {
  description = "The name of the Azure Resource Group."
  type        = string
  default     = "rg-default"
}

# Azure Location
variable "location" {
  description = "The Azure region where resources will be created."
  type        = string
  default     = "eastus2"
}
