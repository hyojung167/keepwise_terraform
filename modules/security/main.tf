resource "azurerm_user_assigned_identity" "managed_identity" {
  name                = var.managed_identity_name
  location            = var.location
  resource_group_name = var.resource_group_name 
}

resource "azurerm_key_vault" "key_vault" {
  name                        = "${var.project_name}-kv"
  location                    = var.location
  resource_group_name         = var.resource_group_name
  sku_name                    = var.key_vault_sku
  tenant_id                   = var.tenant_id
  purge_protection_enabled    = false
  soft_delete_retention_days  = 7

  access_policy {
    tenant_id = var.tenant_id
    object_id = azurerm_user_assigned_identity.managed_identity.principal_id 
    }
}

