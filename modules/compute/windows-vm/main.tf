#Azure에서 기본적인 Windows 가상 머신을 생성하는 모듈

resource "azurerm_windows_virtual_machine" "windows_vm" {
  name                  = var.name
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = var.network_interface_ids
  size                  = var.vm_size

  admin_username        = var.admin_username
  admin_password        = var.admin_password

  os_disk {
    name                 = "${var.name}-osdisk"
    caching              = "ReadWrite"
    storage_account_type = var.os_disk_type
  }

  source_image_reference {
    publisher = var.image.publisher
    offer     = var.image.offer
    sku       = var.image.sku
    version   = var.image.version
  }

  enable_automatic_updates = true
  timezone                 = var.timezone

  tags = var.tags
}
