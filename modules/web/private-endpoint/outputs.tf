output "private_endpoint_id" {
  value = azurerm_private_endpoint.appservice_pe.id
}

output "dns_zone_name" {
  value = azurerm_private_dns_zone.appservice_dns.name
}
