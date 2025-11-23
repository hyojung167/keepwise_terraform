output "cognitive_account_id" {
  description = "Azure OpenAI Cognitive Account resource ID"
  value       = azurerm_cognitive_account.openai.id
}

output "cognitive_account_endpoint" {
  description = "Azure OpenAI endpoint URL"
  value       = azurerm_cognitive_account.openai.endpoint
}


output "private_endpoint_id" {
  description = "Private endpoint resource ID for Azure OpenAI"
  value       = azurerm_private_endpoint.openai_pe.id
}


output "primary_access_key" {
  description = "Primary access key for Azure OpenAI (use carefully)"
  value       = azurerm_cognitive_account.openai.primary_access_key
  sensitive   = true
}
