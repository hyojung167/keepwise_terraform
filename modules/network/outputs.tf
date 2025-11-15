output "vnet_id" {
    description = "vnet_id"
    value = azurerm_virtual_network.vnet.id 
}

output "vnet_name" {
    description = "vnet_name"
    value = azurerm_virtual_network.vnet.name
}

output "vnet_address_space"{
    description = "vnet ip"
    value = azurerm_virtual_network.vnet.address_space
}

output "subnet_ids" {
    description = "subnet id"
    value = {for k, v in azurerm_subnet.subnets : k => v.id}
}

output "subnet_names" {
    description = "subnet names"
    value = [for subnet in azurerm_subnet.subnets : subnet.name]
}

output "nsg_ids" {
    description = "nsg id"
    value = {for k, v in azurerm_network_security_group.nsg : k => v.id}
}