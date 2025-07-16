output "vm_id" {
  value = azurerm_windows_virtual_machine.vm_mssql.id
}

output "vm_private_ip" {
  value = azurerm_windows_virtual_machine.vm_mssql.private_ip_address
}
