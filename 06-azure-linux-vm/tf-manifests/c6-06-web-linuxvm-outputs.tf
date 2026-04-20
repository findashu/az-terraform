# Public IP Address
output "web_linuxvm_public_ip" {
  description = "Web Linux VM Public IP"
  value       = azurerm_public_ip.web_linuxvm_publicip.ip_address
}

output "web_linuxvm_nic_id" {
  description = "Web Linux VM Network Interface ID"
  value       = azurerm_network_interface.web_linuxvm_nic.id
}

output "web_linuxvm_network_interface_private_ip" {
  description = "Web Linux VM Private IP Address"
  value       = [azurerm_network_interface.web_linuxvm_nic.private_ip_address]
}

output "web_linuxvm_id" {
  description = "Web Linux VM Id"
  value       = azurerm_linux_virtual_machine.web_vm.id
}
