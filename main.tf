
//Resource Group
resource "azurerm_resource_group" "rg" {
    name  = var.resource_group_name
    location = var.location
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