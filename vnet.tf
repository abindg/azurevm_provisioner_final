#Creates a Vnet after checking that it is not there

locals {
  vnetlocal = "${local.resource_name_prefix}-${var.vnetname}"
}

output "namelocal" {
   value = local.vnetlocal
}

data "azurerm_resources" "virt" {
  name = local.vnetlocal
  resource_group_name = local.rg_used
}

resource "azurerm_virtual_network" "myvnet" {
  count = length(data.azurerm_resources.virt.resources) > 0 ? 0 : 1
  name = "${local.vnetlocal}"
  location = var.resourcegrouplocation
  resource_group_name = "${local.rg_used}"
  address_space = var.vnetaddress
}

data "azurerm_virtual_network" vnets {
  count = length(data.azurerm_resources.virt.resources) > 0 ? 1 : 0
  name = local.vnetlocal
  resource_group_name = local.rg_used
}


locals {
  vnet_used = length(data.azurerm_resources.virt.resources) > 0 ? data.azurerm_resources.virt.resources[0]: azurerm_virtual_network.myvnet[0]
}

/*
output "datavnet" {
  value = data.azurerm_resources.virt.resources
}
*/

output "vnetused" {

  value = local.vnet_used.name
  
}









