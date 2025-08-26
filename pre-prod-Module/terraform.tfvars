eah-rg = {
  rg1 = {
    name     = "pre-prod-eah-us-rg4"
    location = "west us"
  }
}

eah-vnet = {
  vnet1 = {
    name                = "eah-us-vnet1"
    resource_group_name = "eah-us-rg1"
    location            = "west us"
    address_space       = ["10.0.0.0/16"]
  }
}

eah-subnet = {
  subnet1 = {
    name                 = "eah-us-subnet1"
    resource_group_name  = "eah-us-rg1"
    virtual_network_name = "eah-us-vnet1"
    address_prefixes     = ["10.0.0.0/24"]
  }
}

eah-nic = {
  nic1 = {
    name                = "eah-us-nic1"
    location            = "west us"
    resource_group_name = "eah-us-rg1"
  }
}

eah-linux-vm = {
  linux_vm = {
    name                = "eah-us-linux-vm1"
    resource_group_name = "eah-us-rg1"
    location            = "west us"
    size                = "Standard_F2"
    admin_username      = "adminuser"
    admin_password      = "Passw0rd@12345"

  }
}