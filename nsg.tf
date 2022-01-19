locals {
  nsg_local = "${local.resource_name_prefix}-${var.nsg}"
}

/*
locals {
  nsg_mapping = {
      "${var.webnsg}" = "${var.webSubnetname}"
      "${var.dbnsg}" = "${var.dbsubnetname}"
  }
}
*/
# Creating network security groups

data "azurerm_resources" "nsg_net" {
  name = local.nsg_local
  resource_group_name = local.rg_used
}

resource "azurerm_network_security_group" "nsg" {
 count = length(data.azurerm_resources.nsg_net.resources) > 0 ? 0 : 1
  name = "${local.resource_name_prefix}-${var.nsg}"
  location = var.resourcegrouplocation
  resource_group_name = local.rg_used
}

locals {
 nsg_used = length(data.azurerm_resources.nsg_net.resources) > 0 ? data.azurerm_resources.nsg_net.resources[0] : azurerm_network_security_group.nsg[0] 
}
  #Associating Subnet with network security groups 

  resource "azurerm_subnet_network_security_group_association" "nsgsubnetassociation" {
   count = length(data.azurerm_resources.nsg_net.resources) > 0 ? 0 : 1
  subnet_id                 = local.subnet_used.id
  network_security_group_id = local.nsg_used.id
  depends_on = [
    azurerm_network_security_rule.net-security-rule,
  ]
  }

 /* 
# Creating Security rules
  locals {
    portmapping = {
      100 : 22
      110 : 80
      200 : 443
    }
  }
  */
  
  resource "azurerm_network_security_rule" "net-security-rule" {
   # for_each = local.portmapping
   count = length(data.azurerm_resources.nsg_net.resources) > 0 ? 0 : length(var.nsgports) 
  name                        = "Sec-Rule-${count.index}"
  priority                    = 100 + count.index
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = var.nsgports[count.index]
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = local.rg_used
  network_security_group_name = local.nsg_used.name
}





