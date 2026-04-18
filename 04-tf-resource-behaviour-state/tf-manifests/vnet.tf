# Create Virtual Network
resource "azurerm_virtual_network" "myvnet" {
  name                = "tf-learning-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name

  tags = {
    environment = "learning"
  }
}

# Create Subnet
resource "azurerm_subnet" "mysubnet" {
  name                 = "tf-learning-subnet-01"
  resource_group_name  = azurerm_resource_group.myrg.name
  virtual_network_name = azurerm_virtual_network.myvnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Create public ip address
resource "azurerm_public_ip" "mypip" {
  name                = "tf-learning-pip"
  location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name
  allocation_method   = "Static"
  tags = {
    environment = "learning"
  }
}

# Create network interface
resource "azurerm_network_interface" "mynic" {
  name                = "tf-learning-nic"
  location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.mysubnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.mypip.id
  }
  tags = {
    environment = "learning"
  }
}
