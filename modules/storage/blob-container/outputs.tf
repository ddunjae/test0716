module "blob_container" {
  source               = "./modules/storage/blob-container"
  name                 = "tfstate"
  storage_account_name = module.storage_account.storage_account_name
  access_type          = "private"

  metadata = {
    purpose = "terraform-backend"
  }
}
