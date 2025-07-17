
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
  source              = "./modules/network/snet"
  subnets             = var.subnets
  resource_group_name = azurerm_resource_group.rg.name
  vnet_name           = var.vnet1
  depends_on = [ module.vnet0717 ]
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
  depends_on = [
    module.nsg0717
    ]
}
//NIC
module "nic0717" {
  source = "./modules/compute/nic"
  name = var.linux_nic_name
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  subnet_id = module.snet0717.subnet_ids["test-subnet-1"]
  depends_on = [module.snet0717]
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

//Windows NSG
module "windows_nsg0717" {
  source = "./modules/network/nsg"
  nsg_name = var.windows_nsg_name
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}
module "windows_nsg_rule0717" {
  source              = "./modules/network/nsg-rule"
  resource_group_name = var.resource_group_name
  nsg_name            = var.windows_nsg_name
  rules = {
    "allow-rdp" = {
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "3389"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }
  depends_on = [
    module.windows_nsg0717
    ]
}

//windows nic

module "nic0717-windows" {
  source = "./modules/compute/nic"
  name = var.windows_nic_name
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  subnet_id = module.snet0717.subnet_ids["test-subnet-1"]
  depends_on = [module.snet0717]
}
//windows vm
module "vm_windows0717" {
  source              = "./modules/compute/windows-vm"
  name                = var.windows_vm_name
  location            = var.location
  resource_group_name = var.resource_group_name
  vm_size             = var.windows_vm_size
  network_interface_ids = [module.nic0717-windows.nic_id]
  admin_username      = var.windows_vm_username
  admin_password      = var.windows_vm_password
  depends_on          = [module.nic0717, module.windows_nsg_rule0717]
}

//WEB APP
module "webapp0717" {
  source              = "./modules/appservice/webapp"
  name                = var.webapp_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = module.app_service_plan0717.app_service_plan_id
  app_settings        = var.webapp_app_settings
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