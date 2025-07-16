
//Resource Group
resource "azurerm_resource_group" "rg" {
    name  = var.resource_group_name
    location = var.location
}
module "vnet" {
  source              = "./modules/network/vnet"
  vnet_name           = "test-conor-vnet"
  address_space       = var.vnet_address_space  # 변수로 전달
  location            = var.location
  resource_group_name = var.resource_group_name
}
# Subnet 모듈
module "snet" {
  source              = "./modules/network/snet"
  subnets = var.subnets  # 변수로 전달
  resource_group_name = azurerm_resource_group.rg.name
  vnet_name           = module.vnet.vnet_name
}



module "pip_app" {
  source              = "./modules/network/pip"
  name                = "pip-app-service"
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Static"
  sku                 = "Standard"
}


module "linux-vm-nsg" {
  source = "./modules/network/nsg"
  nsg_name            = "test-conor-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name
}

module "windows_vm" {
  source = ".modules/compute/windows-vm"
  vm_name            = "test-conor-windows-vm"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = "Standard_DS1_v2"
  admin_username     = "conoradmin"
  admin_password     = "Conor@1234"

  os_disk_type       = "Standard_LRS"
  network_interface_ids = [module.linux-vm-nsg.nsg_id]
  image = {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
  tags = {
    environment = "test"
    owner       = "conor"
  }
  
  
}










#Storage Account
resource "azurerm_storage_account" "storage_account" {
    name                     = var.stoage_account_name
    resource_group_name      = azurerm_resource_group.rg.name
    location                 = azurerm_resource_group.rg.location
    account_tier             = "Standard"
    account_replication_type = "LRS"
    min_tls_version          = "TLS1_2"
    #allow_blob_public_access = false
    #enable_https_traffic_only = true
    }
resource "azurerm_storage_container" "tfstate_container" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.storage_account.name
  container_access_type = "private"
}