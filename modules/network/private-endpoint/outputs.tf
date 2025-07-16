output "private_endpoint_id" {
  value = azurerm_private_endpoint.private_endpoint.id
}

output "network_interface_ids" {
  value = azurerm_private_endpoint.private_endpoint.network_interface_ids
}
