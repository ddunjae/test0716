#PaaS SQL Server 모듈
resource "azurerm_mssql_server" "sql_server" {
  name                         = var.name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = var.version
  administrator_login          = var.admin_login
  administrator_login_password = var.admin_password

  minimum_tls_version = "1.2"

  tags = var.tags
}
