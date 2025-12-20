resource "azurerm_resource_group" "rg_vm" {
for_each = var.resource_groups
  name     = each.value.name
  location = each.value.location
  tags = each.value.tags
  managed_by = each.value.managed_by
}