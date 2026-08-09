resource "azurerm_virtual_network" "vnet" {
    for_each = var.vnets
  name                = each.value.vnet-name
  address_space       = each.value.address_space
  location            = each.value.vnet-location
  resource_group_name = each.value.rg-name
}
