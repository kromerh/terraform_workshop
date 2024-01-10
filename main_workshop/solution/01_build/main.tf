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

resource "random_string" "random_id" {
  length  = 8
  special = false
  upper   = false
  numeric = true
}

resource "azurerm_storage_account" "the-best-storage-account-ever" {
  name                     = format("sttfworkshop%s", random_string.random_id.result)
  resource_group_name      = azurerm_resource_group.the-best-resource-group-ever.name
  location                 = azurerm_resource_group.the-best-resource-group-ever.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    owner       = format("owner-%s", random_string.random_id.result),
    environment = format("environment-%s", random_string.random_id.result)
  }
}

resource "azurerm_resource_group" "the-best-resource-group-ever" {
  name     = format("rg-tf-workshop-%s", random_string.random_id.result)
  location = "switzerlandnorth"
}
