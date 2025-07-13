
data "azurerm_network_interface" "nic" {
  for_each            = var.eah-linux-vm
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_subnet" "subnet" {
  for_each             = var.eah-subnet
  name                 = each.value.name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}