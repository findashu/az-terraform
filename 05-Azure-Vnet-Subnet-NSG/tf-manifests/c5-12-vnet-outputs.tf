# VNET Outputs

output "vitual_network_name" {
  description = "Virtual Network Name"
  value       = azurerm_virtual_network.vnet.name
}

# VNET ID
output "vitual_network_id" {
  description = "Virtual Network ID"
  value       = azurerm_virtual_network.vnet.id
}

# Subnet Outputs
output "web_subnet_name" {
  description = "Web Subnet Name"
  value       = azurerm_subnet.websubnet.name
}

output "web_subnet_id" {
  description = "Web Subnet ID"
  value       = azurerm_subnet.websubnet.id
}

output "db_subnet_name" {
  description = "DB Subnet Name"
  value       = azurerm_subnet.dbsubnet.name
}

output "db_subnet_id" {
  description = "DB Subnet ID"
  value       = azurerm_subnet.dbsubnet.id
}

output "bastion_subnet_name" {
  description = "Bastion Subnet Name"
  value       = azurerm_subnet.bastionsubnet.name
}

output "bastion_subnet_id" {
  description = "Bastion Subnet ID"
  value       = azurerm_subnet.bastionsubnet.id
}

# NSG Outputs only for Web Subnet, you can add NSG outputs for other subnets as well if you want to.
output "web_subnet_nsg_name" {
  description = "Web Subnet NSG Name"
  value       = azurerm_network_security_group.websubnet_nsg.name
}

output "web_subnet_nsg_id" {
  description = "Web Subnet NSG ID"
  value       = azurerm_network_security_group.websubnet_nsg.id
}

