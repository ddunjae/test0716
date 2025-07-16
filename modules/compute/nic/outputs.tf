output "nic_id" {
  value = azurerm_network_interface.nic.id
}

output "private_ip" {
  value = azurerm_network_interface.nic.private_ip_address
}

output "nic_name" {
  value = azurerm_network_interface.nic.name
}
