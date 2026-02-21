output "public_ip_address" {
  value = azurerm_linux_virtual_machine.vm.public_ip_address
}

output "vm_id" {
  value = azurerm_linux_virtual_machine.vm.id
}
