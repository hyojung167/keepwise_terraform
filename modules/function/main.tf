# Create a Log Analytics workspace for Applicaion insights
resource "azurerm_log_analytics_workspace" "example" {
  name                = var.log_analytics_workspace_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = var.log_analytics_retention_in_days

}

# Create an Application Insights instance for monitoring
resource "azurerm_application_insights" "example" {
  name                = "${var.project_name}-appinsights"
  location            = var.location
  resource_group_name = var.resource_group_name
  application_type    = "web"
  workspace_id        = azurerm_log_analytics_workspace.example.id

}

# Create a service plan for the Function App
resource "azurerm_service_plan" "primary" {
  name                = "${var.project_name}-serviceplan"
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type = "Linux"
  sku_name = "Y1" # Consumption plan
}

# Create a function app
resource "azurerm_linux_function_app" "primary" {
  name                = "${var.project_name}-functionapp"
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = azurerm_service_plan.primary.id

  storage_account_name        = var.storage_account_name
  storage_account_access_key  = var.storage_account_primary_access_key
  functions_extension_version = "~4"

  site_config {
    application_stack {
      python_version = "3.11"
    }
  }

  app_settings = {
    "APPINSIGHTS_INSTRUMENTATIONKEY"        = azurerm_application_insights.example.instrumentation_key
    "APPLICATIONINSIGHTS_CONNECTION_STRING" = azurerm_application_insights.example.connection_string
    "FUNCTIONS_EXTENSION_VERSION"           = "~4"
    "WEBSITE_RUN_FROM_PACKAGE"              = "1"
  }
}


