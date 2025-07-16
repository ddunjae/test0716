#Subnet에 특정 서비스(Flexible Server, App Service 등)를 위임(Delegation) 하기 위한 모듈
resource "azurerm_subnet_delegation" "delegation" {
  name = var.name
  subnet_id = var.subnet_id

  service_delegation {
    name    = var.service_name  # 예: Microsoft.DBforMySQL/flexibleServers
    actions = var.actions       # 예: ["Microsoft.Network/virtualNetworks/subnets/action"]
  }
}
