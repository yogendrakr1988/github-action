data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "kv" {
  for_each = var.kv

  name                = each.value.kv-name
  location            = each.value.kv-location
  resource_group_name = each.value.rg-name

  tenant_id = data.azurerm_client_config.current.tenant_id
  sku_name  = "standard"

  rbac_authorization_enabled = false
  soft_delete_retention_days = 7
  purge_protection_enabled   = true

access_policy {
  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = data.azurerm_client_config.current.object_id

  secret_permissions = [
    "Get",
    "Set",
    "List"
  ]
}

}

resource "random_password" "vm_password" {
  for_each = var.vms

  length           = 20
  special          = true
  override_special = "!@#$%&*"
}

resource "azurerm_key_vault_secret" "vm_password" {
  for_each = var.vms

  name         = "${each.value.vm-name}-password"
  value        = random_password.vm_password[each.key].result
  key_vault_id = azurerm_key_vault.kv["kv1"].id
}