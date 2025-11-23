resource "azurerm_cosmosdb_account" "cosmos_account" {
  name                = "cosmos-account-${var.project_name}"
  location            = var.location
  resource_group_name = var.resource_group_name
  offer_type          = var.cosmos_offer_type
  kind                = var.cosmos_kind

  consistency_policy {
    consistency_level = var.consistency_level
  }

  geo_location {
    location          = var.location
    failover_priority = 0
  }
}

resource "azurerm_cosmosdb_sql_database" "cosmos_database" {
  name                = "cosmos-db-${var.project_name}"
  resource_group_name = var.resource_group_name
  account_name        = azurerm_cosmosdb_account.cosmos_account.name
  throughput          = 400
}

resource "azurerm_cosmosdb_sql_container" "cosmos_container" {
  name                = "cosmos-container-${var.project_name}"
  resource_group_name = var.resource_group_name
  account_name        = azurerm_cosmosdb_account.cosmos_account.name
  database_name       = azurerm_cosmosdb_sql_database.cosmos_database.name
  partition_key_paths = ["/partitionKey"]
}

resource "azurerm_storage_account" "storage_account" {
  name                     = lower(replace("storage-account-${var.project_name}", "-", ""))
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.storage_account_tier
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "storage_container" {
  name                  = "blob-container-${var.project_name}"
  storage_account_id    = azurerm_storage_account.storage_account.id
  container_access_type = "private"
}

resource "azurerm_private_endpoint" "cosmos_private_endpoint" {
  name                = "pe-cosmos-${var.project_name}"
  resource_group_name = var.resource_group_name
  location            = var.location
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "psc-cosmos-${var.project_name}"
    is_manual_connection           = false
    private_connection_resource_id = azurerm_cosmosdb_account.cosmos_account.id
    subresource_names              = ["Sql"]
  }

  private_dns_zone_group {
    name                 = "pdz-cosmos"
    private_dns_zone_ids = [var.cosmos_private_dns_zone_id]
  }
}

resource "azurerm_private_endpoint" "blob_private_endpoint" {
  name                = "pe-blob-${var.project_name}"
  resource_group_name = var.resource_group_name
  location            = var.location
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "psc-blob-${var.project_name}"
    is_manual_connection           = false
    private_connection_resource_id = azurerm_storage_account.storage_account.id
    subresource_names              = ["blob"]
  }

  private_dns_zone_group {
    name                 = "pdz-blob"
    private_dns_zone_ids = [var.blob_private_dns_zone_id]
  }
}
