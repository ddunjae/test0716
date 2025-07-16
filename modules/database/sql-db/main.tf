#Azure SQL Server 위에 SQL Database (인스턴스)를 생성하는 역할을 하는 모듈
resource "azurerm_mssql_database" "sql_db" {
  name                = var.name
  server_id           = var.server_id
  sku_name            = var.sku_name
  collation           = var.collation
  max_size_gb         = var.max_size_gb
  zone_redundant      = var.zone_redundant
  read_scale          = var.read_scale

  tags = var.tags
}
