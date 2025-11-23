variable "resource_group_name" {
  description = "The name of the resource group in which to create the VM."
  type        = string
}

variable "location" {
    description = "The Azure location where the VM will be created."
    type        = string
}

variable "project_name" {
    description = "The name of the project."
    type        = string
}

variable "log_analytics_workspace_name" {
    description = "The name of the Log Analytics workspace."
    type        = string
  
}

variable "log_analytics_retention_in_days" {
    description = "The number of days to retain data in the Log Analytics workspace."
    type        = number
    default     = 30
  
}

variable "tags" {
    description = "A map of tags to assign to the resource."
    type        = map(string)
    default     = {}
}

variable "storage_account_name" {
    description = "The name of the storage account to be used by the Function App."
    type        = string
  
}

variable "storage_account_primary_access_key" {
    description = "The primary access key for the storage account."
    type        = string
}

