data "azurerm_public_ip" "pip-vm1" {
 for_each = var.network_interfaces
  name                = each.value.public_ip
  resource_group_name = each.value.resource_group_name 
}

