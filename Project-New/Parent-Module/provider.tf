terraform {
  required_version = ">= 1.5.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.80.0"
    }
  }
}
# terraform {
#   backend "azurerm" {
#     resource_group_name  = "sandeep-stgrg"
#     storage_account_name = "sandeepstg3221158"
#     container_name       = "sandeep-cont"
#     key                  = "sandeepinfra.tfstate"
#   }
#}
provider "azurerm" {
  features {}
}