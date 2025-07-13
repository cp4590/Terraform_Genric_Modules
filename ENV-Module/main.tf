module "resource_group" {
  source = "../Infra_Module/EAH-RG"
  eah-rg = var.eah-rg
}

module "vnet" {
  source     = "../Infra_Module/EAH-Vnet"
  eah-vnet   = var.eah-vnet
  depends_on = [module.resource_group]
}

module "subnet" {
  source     = "../Infra_Module/EAH-Subnet"
  eah-subnet = var.eah-subnet
  depends_on = [module.vnet]
}


module "linux_vm" {
  source       = "../Infra_Module/EAH-Linux_VM"
  eah-linux-vm = var.eah-linux-vm
  eah-nic      = var.eah-nic
  eah-subnet   = var.eah-subnet
  depends_on   = [module.subnet, module.resource_group, module.vnet]
}