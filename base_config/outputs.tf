output "resource_group_name" {
  value = azurerm_resource_group.main.name
}

output "vnet_id" {
  value = module.network.vnet_id
}

output "storage_account_primary_blob_endpoint" {
  value = module.storage.primary_blob_endpoint
}

output "vm_public_ip" {
  value = module.compute.public_ip_address
}
