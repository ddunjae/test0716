
#App Service에 대해 Private Endpoint를 설정하여, VNet 내부에서만 접근하도록 구성 하는 모듈
resource "azurerm_private_endpoint" "appservice_pe" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "${var.name}-connection"
    private_connection_resource_id = var.appservice_id
    subresource_names              = ["sites"]
    is_manual_connection           = false
  }

  tags = var.tags
}

resource "azurerm_private_dns_zone" "appservice_dns" {
  name                = "privatelink.azurewebsites.net"
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "appservice_dns_link" {
  name                  = "${var.name}-dnslink"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.appservice_dns.name
  virtual_network_id    = var.vnet_id
}
