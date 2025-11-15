output "public_ip_id" {
    value = azurerm_public_ip.agw_pip.id
}

output "gateway_id" {
    value = azurerm_application_gateway.agw.id
}

output "frontend_ip" {
    value = azurerm_public_ip.agw_pip.ip_address
}