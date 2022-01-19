resource "azurerm_linux_virtual_machine" "linuxvm" {
  count = var.vmcount
  name = "${local.resource_name_prefix}-${var.hostname}-${count.index}"
  resource_group_name = local.rg_used
  location = var.resourcegrouplocation
  size = var.size
  admin_username = var.user
  admin_password = var.password
  disable_password_authentication = false
  network_interface_ids = [
    local.vnic_used[count.index].id,
  ]
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference { 
    publisher = "Redhat"
    offer     = "RHEL"
    sku       = "7.5"
    version   = "latest"
    }

   # custom_data = filebase64("${path.module}/app-scripts/bootstrap.sh")
    
  }
  
 