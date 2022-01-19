# Resource-1: Azure Resource Group -> Creates if not present
locals {
  rsglocal = "${local.resource_name_prefix}-${var.resourcegroupname}"
}

data "azurerm_resources" "rg" {
  resource_group_name = local.rsglocal
}


resource "azurerm_resource_group" "rsg" {
  count = length(data.azurerm_resources.rg.resource_group_name) > 0 ? 0 : 1
  name = local.rsglocal
  location = var.resourcegrouplocation
}

locals {
  rg_used = data.azurerm_resources.rg.resource_group_name != null ? data.azurerm_resources.rg.resource_group_name : azurerm_resource_group.rsg[0].name 
}

output "rglocal" {
  value = local.rg_used
}