terraform {
  # The backend configuration can be used to store the state file in a remote location.
  # For this example, we'll keep it local, but you can uncomment the azurerm block for remote state.
  
  /*
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "tfstatestorage"
    container_name       = "tfstate"
    key                  = "base_config.terraform.tfstate"
  }
  */

  backend "local" {
    path = "terraform.tfstate"
  }
}
