resource "azurerm_virtual_network" "vnet1" {
  for_each            = var.eah-vnet
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  address_space       = each.value.address_space
  #depends_on          = [azurerm_resource_group.rg1]
}
