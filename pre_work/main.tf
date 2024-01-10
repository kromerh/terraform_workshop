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

resource "azurerm_resource_group" "rg" {
  name     = format("rg-tf-workshop-pre-%s", random_string.random_id.result)
  location = "switzerlandnorth"
}
