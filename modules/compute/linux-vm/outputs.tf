output "vm_id" {
  value = azurerm_linux_virtual_machine.linux_vm.id
}

output "vm_name" {
  value = azurerm_linux_virtual_machine.linux_vm.name
}

output "vm_private_ip" {
  value = azurerm_linux_virtual_machine.linux_vm.private_ip_address
}
