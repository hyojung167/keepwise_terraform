variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
}

variable "address_space" {
  description = "The address space for the virtual network"
  type        = list(string)
}

variable "location" {
  description = "The location of the virtual network"
  type        = string
}

variable "create_nsg" {
  description = "Whether to create a Network Security Group"
  type        = bool
  default     = true
}

variable "subnets" {
  description = "A list of subnets to create in the virtual network"
  type = list(object({
    name           = string
    address_prefixes = list(string), public = bool
  }))
}