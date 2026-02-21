resource "azurecaf_name" "rg_name" {
  name          = "gr-terraform"
  resource_type = "azurerm_resource_group"
  prefixes      = ["test"]
  suffixes = [ "1", "2", "3" ]
  random_length  = 4
  clean_input = true
}

resource "azurerm_resource_group" "rg" {
  name     = azurecaf_name.rg_name.result
  location = var.location
}