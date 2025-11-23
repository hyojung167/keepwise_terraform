output "cosmosdb_account_id" {
  value = azurerm_cosmosdb_account.cosmos_account.id
}

output "cosmosdb_endpoint" {
  value = azurerm_cosmosdb_account.cosmos_account.endpoint
}

output "storage_account_id" {
  value = azurerm_storage_account.storage_account.id
}

output "storage_primary_blob_endpoint" {
  value = azurerm_storage_account.storage_account.primary_blob_endpoint
}

output "storage_account_name" {
  value = azurerm_storage_account.storage_account.name
}

output "storage_account_primary_access_key" {
  value = azurerm_storage_account.storage_account.primary_access_key  
}