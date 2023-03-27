# terraform {
#   required_providers {
#     azurerm = {
#       source = "hashicorp/azurerm"
#       version = "3.48.0"
#     }
#   }
# }

# provider "azurerm" {
#   # Configuration options
#   subscription_id = "cab7d085-3e06-48c0-8689-d3a4ce7afeec"
#   client_id = "dc47bbb7-0198-42c3-8d80-02676f70110d"
#   client_secret = "Y5W8Q~iIqMPhbmetjeSTSKazN_UNKiMchOXsKatK"
#   tenant_id = "850aa78d-94e1-4bc6-9cf3-8c11b530701c"
#   features {}

# }
variable "storage_account_name" {
    type = string
    description = "please enter the storage account name"
  
}

locals {
  resource_group = "terra_form"
  location = "North Europe"
}

resource "azurerm_storage_account" "storage_account" {
  name                     = var.storage_account_name
  resource_group_name      = local.resource_group
  location                 = local.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

}
resource "azurerm_storage_container" "var_container" {
    name = "var-sample"
    storage_account_name = var.storage_account_name
    container_access_type = "private"
    depends_on = [
      azurerm_storage_account.storage_account
    ]
  
}

resource "azurerm_storage_blob" "var_blob" {
  name                   = "Employee.csv"
  storage_account_name   = var.storage_account_name
  storage_container_name = "var-sample"
  type                   = "Block"
  source                 = "employees.csv"
  depends_on = [
    azurerm_storage_container.var_container
  ]
}


