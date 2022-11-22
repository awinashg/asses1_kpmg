terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.26.0"
    }
  }
  backend "azurerm" {
  resource_group_name      = "asses1_rgtf"
  storage_account_name     = "asses1storageaccounttf"
  container_name           = "terraform"
  key                      = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}