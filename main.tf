
//Resource Group
resource "azurerm_resource_group" "rg" {
    name  = var.resource_group_name
    location = var.location
}
//VNET
module "vnet0717" {
  source = "./modules/network/vnet"
  vnet_name = var.vnet1
  address_space = var.vnet1_address_space
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
}
module "snet0717" {
  source = "./modules/network/snet"
  subnets = var.subnets
  resource_group_name = azurerm_resource_group.rg.name
  vnet_name = var.vnet1
  
}

//NSG
module "nsg0717" {
  source = "./modules/network/nsg"
  nsg_name = var.linux_nsg_name
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}
//NSG-Rule
module "nsg_rule0717" {
source              = "./modules/network/nsg-rule"
  resource_group_name = var.resource_group_name
  nsg_name            = var.linux_nsg_name

  rules = {
    "allow-ssh" = {
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
    "allow-https" = {
      priority                   = 110
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }
}
//NIC
module "nic0717" {
  source = "./modules/compute/nic"
  name = var.linux_nic_name
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  subnet_id = module.snet0717.subnet_ids["test-subnet-1"]



}
//VM-Linux
module "vm_linux0717" {
  source              = "./modules/compute/linux-vm"
  name                = var.linux_vm_name
  location            = var.location
  resource_group_name = var.resource_group_name
  vm_size             = var.linux_vm_size
  network_interface_ids = [module.nic0717.nic_id]
  admin_username      = var.linux_vm_username
  admin_password      = var.linux_vm_password
}

#Storage Account
module "sa0717" {
  source = "./modules/storage/storage-account"
  name                     = var.stoage_account_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = var.stoage_account_tier
  replication_type         = var.stoage_account_replication_type
}
module "sablob" {
  source = "./modules/storage/blob-container"
  name                     = var.container_name
  storage_account_name    = var.stoage_account_name
  access_type             = "private"
  metadata                = {}

  
}