terraform {
  required_providers {
    panos = {
      source = "paloaltonetworks/panos"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version   = ">= 2.0"
    }
  }
  required_version = ">= 0.13"
} 
provider "azurerm" {
  features {}
}

/*terraform {
  backend "azurerm" {
    resource_group_name  = "core-eastus-prod-tfstate"
    storage_account_name = "sta360coretfstate0"
    container_name       = "tfstate"
    key                  = "panorama360/templates/tenant.tfstate"
  }
}*/
