resource "azurerm_network_interface" "nic" {
for_each = var.nics
  name                = each.value.nic_name
  location            = each.value.rg-location
  resource_group_name = each.value.rg-name

  ip_configuration {
    name                          = each.value.ip_name
    subnet_id                     = data.azurerm_subnet.subnet[each.key].id
    public_ip_address_id          = data.azurerm_public_ip.pip[each.key].id
     private_ip_address_allocation = each.value.ip_allocation
  }
}

