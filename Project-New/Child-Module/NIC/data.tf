data "azurerm_subnet" "subnet" {
  for_each = var.nics
  name                 = each.value.subnet-name
  virtual_network_name = each.value.vnet-name
  resource_group_name  = each.value.rg-name
}




data "azurerm_public_ip" "pip" {
  for_each = var.nics
  name                = each.value.pip-name
  resource_group_name = each.value.rg-name
}
