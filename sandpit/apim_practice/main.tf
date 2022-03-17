# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.65"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "nduckett-training"
  location = "eastus"
  tags = {
    "Owner" = "nathan.duckett@servian.com"
    "Client" = "Servian"
    "Purpose" = "training"
  }
}

resource "azurerm_api_management" "example" {
  name                = "nduckett-training"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  publisher_name      = "Servian"
  publisher_email     = "nathan.duckett@servian.com"

  sku_name = "Developer_1"
  
  tags = {
    "Owner" = "nathan.duckett@servian.com"
    "Client" = "Servian"
    "Purpose" = "training"
  }
}