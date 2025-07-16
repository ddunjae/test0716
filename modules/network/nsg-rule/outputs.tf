output "nsg_rule" {
  value = [for rule in azurerm_network_security_rule.nsg_rule : rule.name]
}
