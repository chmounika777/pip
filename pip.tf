
  provider "azurerm" {
  features {}
  client_id       = "3bdd3137-525d-412a-b875-c4362a6a0810"
  client_secret   = "hHI7Q~FX_Jrnbu1QKyOguCjExUDjY.gHIkyst"
  tenant_id       = "1b478c1a-de95-4cca-b620-81b2773ddff3"
subscription_id = "48c7cd04-2b44-4873-b5aa-25b49bd06b94"
}
terraform {
  backend "azurerm" {
   
    storage_account_name = "stotagedev22"
    container_name       = "container1"
    key                  = "terraform.tfstate"
     
  }
}
data "azurerm_resource_group" "example" {
  name     = "rg1"
  location ="east us"
}

resource "azurerm_public_ip" "example" {
  name                = "acceptanceTestPublicIp1"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  allocation_method   = "Static"

  tags = {
    environment = "Production"
  }
}
