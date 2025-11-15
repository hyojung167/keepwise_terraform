variable "resource_group_name" {
    description = "The name of the resource group in which to create the VM."
    type        = string
}

variable "location" {
    description = "The Azure region where the VM will be created."
    type        = string
}

variable "project_name" {
    description = "The project name used for naming resources."
    type        = string
}

variable "subnet_id" {
    description = "The ID of the subnet(db subnet) where the VM will be deployed."
    type        = string
}

variable "cosmos_offer_type" {
    description = "The offer type for the Cosmos DB account."
    type        = string
    default     = "Standard"
}

variable "cosmos_kind" {
    description = "The kind of Cosmos DB account."
    type        = string
    default     = "GlobalDocumentDB"
}

variable "consistency_level" {
    description = "The consistency level for the Cosmos DB account."
    type        = string
    default     = "Session"
}

variable "storage_account_tier" {
    description = "The performance tier of the storage account."
    type        = string
    default     = "Standard"
}

variable "cosmos_private_dns_zone_id" {
    description = "The ID of the private DNS zone for cosmos DB."
    type        = string
}

variable "blob_private_dns_zone_id" {
    description = "The ID of the private DNS zone for Blob storage."
    type        = string
}
