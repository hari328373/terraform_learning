resource "azurerm_resource_group" "sample_res_grp" {
  name = "sample_res_grpv2"
  location = "East US"
}

    resource "azurerm_storage_account" "storage_acc_v2" {
    name                     = "terrav2"
    resource_group_name      = "sample_res_grpv2"
    location                 = "East US"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    depends_on = [
        azurerm_resource_group.sample_res_grp
    ]

    }

    resource "azurerm_storage_container" "sam_con_v2" {
    name                  = "data-sample"
    storage_account_name  = "terrav2"
    container_access_type = "private"
    }

# this is used to upload a local file into container

    resource "azurerm_storage_blob" "blob_v2" {
    name                   = "Employee_details.csv"
    storage_account_name   = "terrav2"
    storage_container_name = "data-sample"
    type                   = "Block"
    source                 = "Emp_details.csv"
    }