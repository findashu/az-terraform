# Resource Create Network Security Group
resource "azurerm_network_security_group" "web_linuxvm_nsg" {
  name                = "${azurerm_network_interface.web_linuxvm_nic.name}-nsg"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = local.common_tags
}

# Associate NSG to Linux VM Network Interface
resource "azurerm_network_interface_security_group_association" "web_linuxvmnic_nsg_assoc" {
  depends_on                = [azurerm_network_security_rule.web_linuxvm_nsg_rule_inbound]
  network_interface_id      = azurerm_network_interface.web_linuxvm_nic.id
  network_security_group_id = azurerm_network_security_group.web_linuxvm_nsg.id
}

locals {
  web_vmnic_inbound_ports_map = {
    "100" : "80"
    "110" : "443"
    "120" : "22"
  }
}

# Create NSG Rules for Linux VM Network Interface
resource "azurerm_network_security_rule" "web_linuxvm_nsg_rule_inbound" {
  for_each                    = local.web_vmnic_inbound_ports_map
  name                        = "Rule-Port-${each.value}"
  priority                    = each.key
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = each.value
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  network_security_group_name = azurerm_network_security_group.web_linuxvm_nsg.name
  resource_group_name         = azurerm_resource_group.rg.name
}
