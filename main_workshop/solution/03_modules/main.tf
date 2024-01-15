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

module "azure_resources" {
  source                           = "./modules/azure_resource_group_and_storage"
  resource_group_name              = format("rg-tf-workshop-%s", random_string.random_id.result)
  location                         = "switzerlandnorth"
  storage_account_name             = format("sttfworkshop%s", random_string.random_id.result)
  storage_account_tier             = "Standard"
  storage_account_replication_type = "LRS"
  tags = {
    owner       = var.owner
    environment = var.environment
  }
}
