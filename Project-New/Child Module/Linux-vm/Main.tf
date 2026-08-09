resource "azurerm_linux_virtual_machine" "vm" {
 for_each = var.vms
  name                = each.value.vm-name
  resource_group_name = each.value.rg-name
  location            = each.value.rg-location
  size                = each.value.vm-size
admin_username = "azureuser"
admin_password = data.azurerm_key_vault_secret.password[each.key].value
disable_password_authentication = "false"
  network_interface_ids = [data.azurerm_network_interface.nic[each.key].id]

  os_disk {
    caching              = each.value.caching
    storage_account_type = each.value.stg_type
  }
  source_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = each.value.version
  }
}
