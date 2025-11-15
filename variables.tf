variable "resource_group_name" {
    description = "The name of the resource group"
    type = string
    default = "t-infrastudy-terraform"
  
}
variable "location" {
    description = "The location of the resources"
    type = string
    default = "korea central"
}
variable "project_name" {
    description = "The name of the project"
    type = string
    default = "infrastudy"
  
}

variable "ssh_public_key" {
  description = "Local SSH public key content"
  type        = string
}

variable "admin_username" {
    description = "The admin username for the VM"
    type        = string
    default     = "azureuser"
  
}