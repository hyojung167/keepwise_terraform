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

variable "publisher_name" {
    description = "The publisher name for the API Management service."
    type        = string
    default = "hyojung"
  
}

variable "publisher_email" {
    description = "The publisher email for the API Management service."
    type        = string
    default = "hyojung167@naver.com"
}

variable "apim_sku_name" {
    description = "The pricing tier of the API Management service."
    type        = string
    default     = "BasicV2"
  validation {
    condition     = contains(["Basic", "BasicV2", "Consumption", "Developer", "Premium", "PremiumV2", "Standard", "StandardV2"], var.apim_sku_name)
    error_message = "The sku must be one of the following: Basic, BasicV2, Consumption, Developer, Premium, PremiumV2, Standard, StandardV2."
  }
}

variable "apim_sku_capacity" {
    description = "The capacity of the API Management service."
    type        = number
    default     = 1
  validation {
    condition     = contains([1, 2], var.apim_sku_capacity)
    error_message = "The sku_count must be one of the following: 1, 2."
  }
}
