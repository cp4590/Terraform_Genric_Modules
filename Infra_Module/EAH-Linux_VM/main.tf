
resource "azurerm_network_interface" "nic1" {
  for_each            = var.eah-nic
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  #depends_on          = [azurerm_resource_group.rg1]

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet["subnet1"].id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "vm1" {
  for_each                        = var.eah-linux-vm
  name                            = each.value.name
  resource_group_name             = each.value.resource_group_name
  location                        = each.value.location
  size                            = each.value.size
  admin_username                  = each.value.admin_username
  admin_password                  = each.value.admin_password
  network_interface_ids           = [data.azurerm_network_interface.nic[each.key].id]
  disable_password_authentication = false
  #depends_on                      = [azurerm_network_interface.nic1, azurerm_resource_group.rg1]

  os_disk {
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
