output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}

# Devuelve un mapa { "subnet-name" = "id" }
output "vnet_subnets" {
  value = { for subnet in azurerm_subnet.subnet : subnet.name => subnet.id }
}

# Devuelve solo la lista de IDs para mantener retrocompatibilidad (si fuera necesario)
output "vnet_subnet_ids" {
  value = values(azurerm_subnet.subnet)[*].id
}
