terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_storage_account" "the-best-storage-account-ever" {
  name                     = "sttfworkshophkr"
  resource_group_name      = azurerm_resource_group.the-best-resource-group-ever.name
  location                 = azurerm_resource_group.the-best-resource-group-ever.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    owner       = "heiko",
    environment = "dev"
  }
}

resource "azurerm_resource_group" "the-best-resource-group-ever" {
  name     = "rg-tf-workshop-hkr"
  location = "switzerlandnorth"
}
