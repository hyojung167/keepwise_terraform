output "vm_id" {
    value = azurerm_linux_virtual_machine.vm.id
    description = "VM resource ID"  
}

output "nic_id" {
    value = azurerm_network_interface.nic.id
    description = "Network Interface ID"
  
}

output public_ip_id {
    value = azurerm_public_ip.pip.id
    description = "Public IP ID"
  
}