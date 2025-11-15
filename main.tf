terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

module "network" {
  source              = "./modules/network"

  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  vnet_name           = "vnet-${var.project_name}"
  address_space       = ["10.0.0.0/16"]

subnets = [
    {
      name             = "subnet-web"
      address_prefixes = ["10.0.1.0/24"]
    },
    {
      name             = "subnet-app"
      address_prefixes = ["10.0.2.0/24"]
    },
    {
      name             = "subnet-db"
      address_prefixes = ["10.0.3.0/24"]
    }
  ]
}


module "vm" {
  source              = "./modules/vm"

  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  vm_name        = "vm-${var.project_name}"
  vm_size        = "Standard_B1s"

  project_name        = var.project_name
  admin_username      = var.admin_username
  ssh_public_key      = file(var.ssh_public_key)
  subnet_id = module.network.subnet_ids["subnet-web"]
  nsg_id    = lookup(module.network.nsg_ids, "subnet-web", null)
  
}