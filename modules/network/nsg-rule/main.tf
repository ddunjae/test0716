#기존 NSG에 Inbound/Outbound Rule을 정의하고, 유연하게 다중 규칙을 반복적으로 생성할 수 있도록 구성하는 모듈

resource "azurerm_network_security_rule" "nsg_rule" {
  for_each                    = var.rules

  name                        = each.key
  priority                    = each.value.priority
  direction                   = each.value.direction
  access                      = each.value.access
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_range      = each.value.destination_port_range
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  resource_group_name         = var.resource_group_name
  network_security_group_name = var.nsg_name
}
