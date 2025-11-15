terraform {
  backend "azurerm" {  
    resource_group_name  = "t-infrastudy-rg"
    storage_account_name = "infrastudy"
    container_name       = "terraform-state"
    key                  = "infrastudy.terraform.tfstate"
  }
}