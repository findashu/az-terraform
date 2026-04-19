# Create DB Teir Subnet
resource "azurerm_subnet" "dbsubnet" {
  name                 = "${azurerm_virtual_network.vnet.name}-${var.db_subnet_name}"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.db_subnet_address_space
}

# Create NSG for DB Subnet
resource "azurerm_network_security_group" "dbsubnet_nsg" {
  name                = "${azurerm_subnet.dbsubnet.name}-nsg"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = local.common_tags
}

# Associate NSG to DB Subnet
resource "azurerm_subnet_network_security_group_association" "dbsubnet_nsg_assoc" {
  depends_on                = [azurerm_network_security_rule.dbsubnet_nsg_rule_inbound]
  subnet_id                 = azurerm_subnet.dbsubnet.id
  network_security_group_id = azurerm_network_security_group.dbsubnet_nsg.id
}

locals {
  db_inbound_ports_map = {
    "100" : "3306", # If the Key starts with number, you must use colon to separate key and value in map, otherwise terraform will throw error.
    "101" : "1433",
    "104" : "22"
  }
}

# Create NSG Rules
resource "azurerm_network_security_rule" "dbsubnet_nsg_rule_inbound" {
  for_each                    = local.db_inbound_ports_map
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
  network_security_group_name = azurerm_network_security_group.dbsubnet_nsg.name
}
