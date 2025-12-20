terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.56.0"
    }
  }
#   backend "azurerm" {
#     resource_group_name  = "backendrg1"
#     storage_account_name = "backendstg178"
#     container_name       = "backendcontainer17"
#     key                  = "dev.terraform.tfstate"
# }



}

provider "azurerm" {
features {}
subscription_id = "6e06e212-633e-4e8c-8ab0-7ea51400a2e2"
}