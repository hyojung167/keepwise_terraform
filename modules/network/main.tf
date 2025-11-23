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
    for_each = var.create_nsg ? { for subnet in var.subnets : subnet.name => subnet if subnet.public } : {} # public 속성이 true인 서브넷에 대해서만 NSG 생성

    name ="${each.value.name}-nsg"
    location = var.location
    resource_group_name = var.resource_group_name
}

locals {
  agw_nsg_name = try(azurerm_network_security_group.nsg["subnet-agw"].name, null)
}

resource "azurerm_network_security_rule" "agw_gateway_ports" {
  for_each = local.agw_nsg_name == null ? {} : { "subnet-agw" = local.agw_nsg_name }

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
  network_security_group_name = each.value
}

resource "azurerm_subnet_network_security_group_association" "nsg_association" {
    for_each = var.create_nsg ? { for subnet in var.subnets : subnet.name => subnet if subnet.public } : {}

    subnet_id                 = azurerm_subnet.subnets[each.key].id
    network_security_group_id = azurerm_network_security_group.nsg[each.key].id
}
