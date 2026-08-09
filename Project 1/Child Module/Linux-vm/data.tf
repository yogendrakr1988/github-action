data "azurerm_network_interface" "nic" {
  for_each = var.vms

  name                = each.value.nic_name
  resource_group_name = each.value.rg-name
}

data "azurerm_key_vault" "kv" {
  name                = "sandeepkvdev710241125"
  resource_group_name = "sandeep1010-rg"
}

data "azurerm_key_vault_secret" "password" {
  for_each = var.vms

  name         = "${each.value.vm-name}-password"
  key_vault_id = data.azurerm_key_vault.kv.id
}