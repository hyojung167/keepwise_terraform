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
