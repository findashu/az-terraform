# Create App Teir Subnet
resource "azurerm_subnet" "appsubnet" {
  name                 = "${azurerm_virtual_network.vnet.name}-${var.app_subnet_name}"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.app_subnet_address_space
}

# Create NSG for App Subnet
resource "azurerm_network_security_group" "appsubnet_nsg" {
  name                = "${azurerm_subnet.appsubnet.name}-nsg"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = local.common_tags
}

# Associate NSG to App Subnet
resource "azurerm_subnet_network_security_group_association" "appsubnet_nsg_assoc" {
  depends_on                = [azurerm_network_security_rule.appsubnet_nsg_rule_inbound]
  subnet_id                 = azurerm_subnet.appsubnet.id
  network_security_group_id = azurerm_network_security_group.appsubnet_nsg.id
}

locals {
  app_inbound_ports_map = {
    "100" : "22", # If the Key starts with number, you must use colon to separate key and value in map, otherwise terraform will throw error.
    "101" : "443",
  }
}

# Create NSG Rules
resource "azurerm_network_security_rule" "appsubnet_nsg_rule_inbound" {
  for_each                    = local.app_inbound_ports_map
  name                        = "Rule-Port-${each.value}"
  priority                    = each.key
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = each.value
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.appsubnet_nsg.name
}
