resource "azurerm_network_interface" "Nic_Card" {
 for_each = var.network_interfaces   
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = each.value.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = data.azurerm_public_ip.pip-vm1[each.key].id
  }
}