terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.36.0"
    }
  }
backend "azurerm"  {
storage_account_name= "hcl9999999"
container_name= "hclcontainer"
resource_group_name = "cprg"
key = "pre-prod-cp.tfstate"
}
}

provider "azurerm" {
  features {}
  subscription_id = "a31b354c-d961-43d8-b6c2-57a22c72a3db"
}
