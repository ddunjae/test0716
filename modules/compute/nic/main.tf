#NIC는 VM이 Azure Virtual Network에 연결될 수 있도록 해주는 필수 리소스
resource "azurerm_network_interface" "nic" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "${var.name}-ipconfig"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = var.private_ip_allocation

    private_ip_address = var.private_ip_allocation == "Static" ? var.private_ip_address : null

    public_ip_address_id = var.public_ip_id
  }

  tags = var.tags
}
