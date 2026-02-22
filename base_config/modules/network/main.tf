resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = var.address_space
  tags                = var.tags
}

# Usamos for_each para que cada subred sea una entidad independiente identificada por su nombre.
resource "azurerm_subnet" "subnet" {
  for_each             = { for i, name in var.subnet_names : name => var.subnet_prefixes[i] }
  
  name                 = each.key
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [each.value]
}
