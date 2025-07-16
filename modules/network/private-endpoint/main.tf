#Azure의 Private Endpoint를 사용하여 PaaS 리소스(SQL, Storage, WebApp 등)에 대해 사설 네트워크를 통한 접근을 구성하는 모듈

resource "azurerm_private_endpoint" "private_endpoint" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "${var.name}-psc"
    private_connection_resource_id = var.target_resource_id
    subresource_names              = var.subresource_names
    is_manual_connection           = var.is_manual_connection
  }

  custom_network_interface_name = var.nic_name
  tags = var.tags
}
