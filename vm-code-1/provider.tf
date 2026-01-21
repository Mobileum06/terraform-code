terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.57.0"
    }
  }
}

provider "azurerm" {


  client_id       = "9c3282f7-789b-4f78-bf42-f18935b625f0"
  client_secret   = "o9B8Q~2_53fymxMrIWsDQMZ8LIZuPeNs9FQQha3g"
  tenant_id       = "d28c7ec6-47e6-4224-ba0d-e01b52e97f9e"
  subscription_id = "6e06e212-633e-4e8c-8ab0-7ea51400a2e2"
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
  }

}
}