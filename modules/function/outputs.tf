output "function_app_id" {
  value = azurerm_linux_function_app.primary.id
}

output "function_app_default_hostname" {
  value = azurerm_linux_function_app.primary.default_hostname
}

output "app_insights_connection_string" {
    value = azurerm_application_insights.example.connection_string
}