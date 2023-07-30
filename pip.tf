
  provider "azurerm" {
  features {}
  client_id       = "3bdd3137-525d-412a-b875-c4362a6a0810"
  client_secret   = "5v58Q~mxlsBIcpCR5MQhlZ-P4c-zKoUxHqrI7aW4"
  tenant_id       = "1b478c1a-de95-4cca-b620-81b2773ddff3"
subscription_id = "48c7cd04-2b44-4873-b5aa-25b49bd06b94"
}

data "azurerm_resource_group" "example" {
  name     = "rg1"
  
}

resource "azurerm_public_ip" "example" {
  name                = "acceptanceTestPublicIp1"
  resource_group_name = data.azurerm_resource_group.example.name
  location            = data.azurerm_resource_group.example.location
  allocation_method   = "Static"

  tags = {
    environment = "Production"
  }
}
