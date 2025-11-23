variable "resource_group_name" {
    description = "The name of the resource group in which to create the VM."
    type        = string
}

variable "location" {
    description = "The location where the VM will be created."
    type        = string
}

variable "project_name" {
    description = "The project name."
    type        = string
}

variable "subnet_id" {
    description = "The ID of the subnet where the private endpoint of openai will be deployed."
    type        = string
}

variable "openai_name" {
    description = "The name of the OpenAI resource."
    type        = string
}

variable "sku_name" {
    description = "The SKU name for the OpenAI resource."
    type        = string
    default     = "S0"
}

variable "openai_private_dns_zone_id" {
    description = "The ID of the Private DNS Zone for OpenAI."
    type        = string
}
