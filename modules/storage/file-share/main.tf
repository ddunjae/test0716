#Azure Files를 위한 파일 공유(File Share) 리소스를 생성하는 모듈
resource "azurerm_storage_share" "file_share" {
  name                 = var.name
  storage_account_name = var.storage_account_name
  quota                = var.quota
  enabled_protocol     = var.enabled_protocol

  metadata = var.metadata
}
