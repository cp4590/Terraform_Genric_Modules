resource "azurerm_subnet" "subnet1" {
  for_each             = var.eah-subnet
  name                 = each.value.name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
  address_prefixes     = each.value.address_prefixes
  #depends_on           = [azurerm_resource_group.rg1, azurerm_virtual_network.vnet1]
}
