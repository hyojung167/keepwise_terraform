resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = var.address_space
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "subnets" {
    for_each = { for subnet in var.subnets : subnet.name => subnet  
    }
    name                 = each.value.name
    resource_group_name  = var.resource_group_name
    virtual_network_name = azurerm_virtual_network.vnet.name
    address_prefixes     = each.value.address_prefixes
}

resource "azurerm_network_security_group" "nsg" {
    for_each = var.create_nsg ? { for subnet in var.subnets : subnet.name => subnet } : {}

    name ="${each.value.name}-nsg"
    location = var.location
    resource_group_name = var.resource_group_name
}

resource "azurerm_network_security_rule" "agw_gateway_ports" {
  count                       = contains(keys(azurerm_network_security_group.nsg), "subnet-agw") ? 1 : 0
  name                        = "Allow-AGW-GatewayPorts"
  priority                    = 200
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_ranges     = ["65200-65535"]
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.nsg["subnet-agw"].name
}

resource "azurerm_subnet_network_security_group_association" "nsg_association" {
    for_each = var.create_nsg ? {for subnet in var.subnets : subnet.name => subnet}: {}

    subnet_id                 = azurerm_subnet.subnets[each.key].id
    network_security_group_id = azurerm_network_security_group.nsg[each.key].id
}
