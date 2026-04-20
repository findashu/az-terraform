# Virtual Network Input Variables

variable "vnet_name" {
  description = "The name of the Virtual Network."
  type        = string
  default     = "vnet-default"
}

# Virtual Network Address Space
variable "vnet_address_space" {
  description = "The address space for the Virtual Network."
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

# Web Subnet Name
variable "web_subnet_name" {
  description = "Virtual Network Web Subnet Name."
  type        = string
  default     = "websubnet"
}

# Web Subnet Address Space  
variable "web_subnet_address_space" {
  description = "The address space for the Web Subnet."
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

# App Subnet Name
variable "app_subnet_name" {
  description = "Virtual Network App Subnet Name."
  type        = string
  default     = "appsubnet"
}

# App Subnet Address Space
variable "app_subnet_address_space" {
  description = "The address space for the App Subnet."
  type        = list(string)
  default     = ["10.0.11.0/24"]
}

# DB Subnet Name
variable "db_subnet_name" {
  description = "Virtual Network DB Subnet Name."
  type        = string
  default     = "dbsubnet"
}

# DB Subnet Address Space
variable "db_subnet_address_space" {
  description = "The address space for the DB Subnet."
  type        = list(string)
  default     = ["10.0.3.0/24"]
}

# Bastion Subnet Name
variable "bastion_subnet_name" {
  description = "Virtual Network Bastion Subnet Name."
  type        = string
  default     = "bastionSubnet"
}

# Bastion Subnet Address Space
variable "bastion_subnet_address_space" {
  description = "The address space for the Bastion Subnet."
  type        = list(string)
  default     = ["10.0.4.0/24"]
}
