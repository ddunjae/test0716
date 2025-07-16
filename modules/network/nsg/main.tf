#Azure NSG(Network Security Group)를 생성하고, Subnet 또는 NIC에 연결하기 위한 모듈

resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}
