data "azurerm_virtual_network" "vnet_a" {
  for_each = var.peering
  name                = each.value.vnet_a
  resource_group_name = each.value.rg_name
}

data "azurerm_virtual_network" "vnet_b" {
  for_each = var.peering
  name                = each.value.vnet_b
  resource_group_name = each.value.rg_name
}

resource "azurerm_virtual_network_peering" "a_b" {
  for_each = var.peering
  name                      = each.value.peering_a_b
  resource_group_name       = each.value.rg_name
  virtual_network_name      = each.value.vnet_a
  remote_virtual_network_id = data.azurerm_virtual_network.vnet_b[each.key].id
}

resource "azurerm_virtual_network_peering" "b_a" {
  for_each = var.peering
  name                      = each.value.peering_b_a
  resource_group_name       = each.value.rg_name
  virtual_network_name      = each.value.vnet_b
  remote_virtual_network_id = data.azurerm_virtual_network.vnet_a[each.key].id
}