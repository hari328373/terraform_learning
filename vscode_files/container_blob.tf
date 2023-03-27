resource "azurerm_storage_container" "container" {
  name                  = "sampledata"
  storage_account_name  = "sampleterraformstorage87"
  container_access_type = "private"
}

# this is used to upload a local file into container

resource "azurerm_storage_blob" "blob" {
  name                   = "Employee_details.csv"
  storage_account_name   = "sampleterraformstorage87"
  storage_container_name = "sampledata"
  type                   = "Block"
  source                 = "Emp_details.csv"
}
