terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.60.0"
    }
  }
}


provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

resource "azurerm_resource_group" "rg" {
  name     = "gr-terraform"
  location = var.location
}