
#Create public ips for each of the servers
resource "azurerm_public_ip" "webpubip" {
    count = var.pubipreqd ? var.vmcount : 0
    name = "${local.resource_name_prefix}-${var.pubipname}-${count.index}"
    resource_group_name = local.rg_used
    location = var.resourcegrouplocation
    allocation_method = "Dynamic" 
}

resource "azurerm_network_interface" "vnic_pubattached" {
  count = var.pubipreqd ? var.vmcount : 0
  name = "${local.resource_name_prefix}-${var.vnicname}-${count.index}"
  resource_group_name = local.rg_used
  location = var.resourcegrouplocation
  ip_configuration {
    name = "internal"
    subnet_id = local.subnet_used.id
    private_ip_address_allocation = "Dynamic"
    #private_ip_address = var.privateip
    primary = true
    public_ip_address_id = azurerm_public_ip.webpubip[count.index].id
  }
}

resource "azurerm_network_interface" "vnic_pubnotattached" {
  count = var.pubipreqd ? 0 : var.vmcount
  name = "${local.resource_name_prefix}-${var.vnicname}-${count.index}"
  resource_group_name = local.rg_used
  location = var.resourcegrouplocation
  ip_configuration {
    name = "internal"
    subnet_id = local.subnet_used.id
    private_ip_address_allocation = "Dynamic"
    #private_ip_address = var.privateip
    primary = true
  }
}

locals {
  vnic_used = var.pubipreqd ? azurerm_network_interface.vnic_pubattached : azurerm_network_interface.vnic_pubnotattached
}

output "nic_value" {
  value = local.vnic_used
}
