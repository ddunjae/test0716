
//Resource Group
resource "azurerm_resource_group" "rg" {
    name  = var.resource_group_name
    location = var.location
}
//Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}
//Subnet
resource "azurerm_subnet" "snet" {
    for_each = var.subnets
    name = each.key
    resource_group_name = azurerm_resource_group.rg.name
    virtual_network_name = azurerm_virtual_network.vnet.name
    address_prefixes = each.value.address_prefixes
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