resource "azurerm_storage_account" "sa_asses1" {
  name                     = "saasses1"
  resource_group_name      = azurerm_resource_group.asses1.name
  location                 = azurerm_resource_group.asses1.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_mssql_server" "mysql_asses1" {
  name                         = "mysql-asses1"
  resource_group_name          = azurerm_resource_group.asses1.name
  location                     = azurerm_resource_group.asses1.location
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"
}

resource "azurerm_mssql_database" "db_asses1" {
  name           = "asses1-db"
  server_id      = azurerm_mssql_server.mysql_asses1.id
  max_size_gb    = 2
  zone_redundant = false

  tags = {
    app = "asses1"
  }
}