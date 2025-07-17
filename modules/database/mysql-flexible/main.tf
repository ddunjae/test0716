#Azure에서 PaaS형 MySQL Flexible Server를 생성하는 모듈
resource "azurerm_mysql_flexible_server" "mysql_flexible" {
  name                   = var.name
  resource_group_name    = var.resource_group_name
  location               = var.location
  administrator_login    = var.admin_username
  administrator_password = var.admin_password
  sku_name               = var.sku_name
  zone                   = var.zone

  storage {
    size_gb = var.storage_gb
  }

  backup_retention_days = var.backup_retention_days
  dynamic "high_availability" {
    for_each = var.ha_enabled ? [1] : []
    content {
      mode = "ZoneRedundant"
    }
  }
}
