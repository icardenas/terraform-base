resource "azurerm_resource_group" "main" {
  name     = local.resource_group_name
  location = var.location
  tags     = local.common_tags
}

module "network" {
  source              = "./modules/network"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  vnet_name           = "vnet-${var.environment}"
  address_space       = ["10.0.0.0/16"]
  subnet_prefixes     = ["10.0.1.0/24"]
  subnet_names        = ["subnet1"]
  tags                = local.common_tags
}

module "storage" {
  source               = "./modules/storage"
  resource_group_name  = azurerm_resource_group.main.name
  location             = azurerm_resource_group.main.location
  storage_account_name = "st${replace(var.project_name, "-", "")}${var.environment}"
  tags                 = local.common_tags
}

module "compute" {
  source              = "./modules/compute"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  subnet_id           = module.network.vnet_subnets[0]
  vm_name             = "vm-${var.environment}"
  tags                = local.common_tags
}
