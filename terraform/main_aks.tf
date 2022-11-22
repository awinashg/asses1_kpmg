resource "azurerm_resource_group" "asses1" {
  name     = "rg_asses1"
  location = "Central India"
}

resource "azurerm_kubernetes_cluster" "aks_asses1" {
  name                = "aks_asses1"
  location            = azurerm_resource_group.asses1.location
  resource_group_name = azurerm_resource_group.asses1.name
  dns_prefix          = "aks-asses1"

  default_node_pool {
    name                = "default"
    vm_size             = "Standard_D4s_v3"
    enable_auto_scaling = true
    node_count          = 1
    max_count           = 3
    min_count           = 1
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "dev"
  }
}