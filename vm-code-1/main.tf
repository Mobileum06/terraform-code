resource "azurerm_resource_group" "rg-1" {
  name = var.resource_group_name
  location = var.location
}


resource "azurerm_virtual_network" "vnet" {
  name                = "example-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg-1.location
  resource_group_name = azurerm_resource_group.rg-1.name
}

resource "azurerm_subnet" "subnet" {
  name                 = "example-subnet"
  resource_group_name  = azurerm_resource_group.rg-1.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]

  
}

resource "azurerm_network_interface" "nic" {
  name                = "example-nic.${each.value.nic_name}"  
  location            = azurerm_resource_group.rg-1.location
  resource_group_name = azurerm_resource_group.rg-1.name
  for_each = var.vm_name


  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.ip-2[each.key].id
  
  }
}
resource "azurerm_network_security_group" "nsg" {
  name                = "acceptanceTestSecurityGroup1"
  location            = azurerm_resource_group.rg-1.location
  resource_group_name = azurerm_resource_group.rg-1.name

  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  
}
resource "azurerm_public_ip" "ip-2" {
  name                = "acceptanceTestPublicIp1.${each.value.ip_address}"
  resource_group_name = azurerm_resource_group.rg-1.name
  location            = azurerm_resource_group.rg-1.location
  allocation_method   = "Static"
  for_each = var.vm_name


  
}
resource "azurerm_network_interface_security_group_association" "nsg" {
  network_interface_id      = azurerm_network_interface.nic[each.key].id
  network_security_group_id = azurerm_network_security_group.nsg.id
  for_each = var.vm_name
}

resource "azurerm_linux_virtual_machine" "vm-1" {
  name                = "VM-1.${each.value.name}"
  resource_group_name = azurerm_resource_group.rg-1.name
  location            = azurerm_resource_group.rg-1.location
  computer_name = "hostname"
  size                = "Standard_D2s_v3"
  admin_username      = "adminuser"
  admin_password = "Password@123"
  disable_password_authentication = false
  for_each = var.vm_name
  
  network_interface_ids = [
    azurerm_network_interface.nic[each.key].id,
  ]

  

  os_disk {
    name                 = "myOsDisk.${each.value.name}"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
     
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}