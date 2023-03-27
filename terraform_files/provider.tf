terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.48.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  subscription_id = "cab7d085-3e06-48c0-8689-d3a4ce7afeec"
  client_id = "dc47bbb7-0198-42c3-8d80-02676f70110d"
  client_secret = "Y5W8Q~iIqMPhbmetjeSTSKazN_UNKiMchOXsKatK"
  tenant_id = "850aa78d-94e1-4bc6-9cf3-8c11b530701c"
  features {}

}
