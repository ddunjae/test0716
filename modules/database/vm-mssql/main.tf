#Windows VM에 SQL Server가 설치된 상태로 배포되도록 구성하는 모듈
resource "azurerm_windows_virtual_machine" "vm_mssql" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  network_interface_ids = [var.nic_id]

  os_disk {
    name                 = "${var.name}-osdisk"
    caching              = "ReadWrite"
    storage_account_type = var.os_disk_type
  }

  source_image_reference {
    publisher = "MicrosoftSQLServer"
    offer     = var.image.offer
    sku       = var.image.sku
    version   = var.image.version
  }

  license_type = "Windows_Server"
  tags         = var.tags
}
