# Azure Storage Account used by the ScubaGear container
resource "azurerm_storage_account" "storage" {
  name                = "${replace(var.resource_prefix, "-", "")}sa"
  resource_group_name = var.resource_group.name
  location            = var.resource_group.location

  account_tier                      = "Standard"
  account_replication_type          = "GZRS"
  account_kind                      = "StorageV2"
  infrastructure_encryption_enabled = true
  enable_https_traffic_only         = true # default
  allow_nested_items_to_be_public   = false
  min_tls_version                   = "TLS1_2"
  identity {
    type = "SystemAssigned"
  }

  network_rules {
    default_action             = "Deny"
    ip_rules                   = var.allowed_access_ips
    virtual_network_subnet_ids = var.subnet_ids
    bypass                     = ["AzureServices"]
  }

  lifecycle {
    ignore_changes = [tags]
  }
}

# Container to store reports generated by ScubaGear
resource "azurerm_storage_container" "output" {
  count                 = var.output_storage_container_id == null ? 1 : 0
  name                  = "${var.resource_prefix}-output"
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "private"
}

# Allows the app registration used by the ScubaGear container to read/write to the storage account
resource "azurerm_role_assignment" "app_storage_role" {
  count                = var.output_storage_container_id == null ? 1 : 0
  scope                = azurerm_storage_account.storage.id
  role_definition_name = "Storage Blob Data Owner"
  principal_id         = var.application_object_id
}

# Container to store configuration needed by ScubaGear
resource "azurerm_storage_container" "input" {
  name                  = "${var.resource_prefix}-input"
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "private"
}

# Blobs containing configuration for each tenant
resource "azurerm_storage_blob" "tenants" {
  for_each               = fileset(var.tenants_dir_path, "*")
  name                   = each.key
  storage_account_name   = azurerm_storage_account.storage.name
  storage_container_name = azurerm_storage_container.input.name
  type                   = "Block"
  source                 = "${var.tenants_dir_path}/${each.key}"

  lifecycle {
    ignore_changes = [
      cache_control
    ]
  }
}
