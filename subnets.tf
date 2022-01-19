#Creates a Subnet if it is not there . Multiple subnet logic not included

locals {
  subnetlocal = "${local.resource_name_prefix}-${var.subnetname}"  
}

locals {
  subnets_present = length(data.azurerm_resources.virt.resources) > 0 ? contains(data.azurerm_virtual_network.vnets[0].subnets, local.subnetlocal) : false
}

data "azurerm_subnet" "sub_net" {
  count = local.subnets_present ? 1 : 0
  name = local.subnetlocal
  virtual_network_name = local.vnet_used.name
  resource_group_name = local.rg_used
}

resource "azurerm_subnet" "subnets" {
  count = local.subnets_present ? 0 : 1
  name = local.subnetlocal
  virtual_network_name = local.vnet_used.name
  resource_group_name = local.rg_used
  address_prefixes     = var.subnetaddress
}

locals {
  subnet_used = local.subnets_present ? data.azurerm_subnet.sub_net[0] : azurerm_subnet.subnets[0]
}

output "subnetdata" {
  value = local.subnet_used.name
}


