resource "azurerm_network_interface" "nic_mgmt" {
  name                                              = "${var.vnet_name}-nic-mgmt-${count.index}"
  location                                          = "${azurerm_resource_group.rg_firewall.location}"
  resource_group_name                               = "${azurerm_resource_group.rg_firewall.name}"
  count                                             = "${var.replicas}"

  ip_configuration {
    name                                            = "${var.vnet_name}-nic-mgmt-ip-${count.index}"
    subnet_id                                       = "${var.subnet_management_id}"
    private_ip_address_allocation                   = "dynamic"
    public_ip_address_id                            = "${azurerm_public_ip.palo_mgmt_ip.id}"
  }
}

resource "azurerm_network_interface" "nic_transit_public" {
  name                                              = "${var.vnet_name}-nic-transit-public-${count.index}"
  location                                          = "${azurerm_resource_group.rg_firewall.location}"
  resource_group_name                               = "${azurerm_resource_group.rg_firewall.name}"
  count                                             = "${var.replicas}"
  enable_ip_forwarding                              = "true"

  ip_configuration {
    name                                            = "${var.vnet_name}-nic-transit-public-ip-${count.index}"
    subnet_id                                       = "${var.subnet_transit_public_id}"
    private_ip_address_allocation                   = "dynamic"
    public_ip_address_id                            = "${azurerm_public_ip.palo_inet_out_pip.id}"
  }
}


resource "azurerm_network_interface" "nic_transit_private" {
  name                                              = "${var.vnet_name}-nic-transit-private-${count.index}"
  location                                          = "${azurerm_resource_group.rg_firewall.location}"
  resource_group_name                               = "${azurerm_resource_group.rg_firewall.name}"
  count                                             = "${var.replicas}"
  enable_ip_forwarding                              = "true"

  ip_configuration {
    name                                            = "${var.vnet_name}-nic-transit-private-ip-${count.index}"
    subnet_id                                       = "${var.subnet_transit_private_id}"
    private_ip_address_allocation                   = "dynamic"
  }
}

resource "azurerm_public_ip" "palo_mgmt_ip" { 
  name                                              = "${var.vnet_name}-palo-mgmt-pip"
  location                                          = "${azurerm_resource_group.rg_firewall.location}"
  resource_group_name                               = "${azurerm_resource_group.rg_firewall.name}"
  domain_name_label                                 = "${var.vnet_name}-palo-mgmt"
  allocation_method                                 = "Static"
  sku                                               = "Standard"	
}


resource "azurerm_public_ip" "palo_inet_out_pip" { 
  name                                              = "${var.vnet_name}-palo-inet-out-pip"
  location                                          = "${azurerm_resource_group.rg_firewall.location}"
  resource_group_name                               = "${azurerm_resource_group.rg_firewall.name}"
  domain_name_label                                 = "${var.vnet_name}-palo-inet-out"
  allocation_method                                 = "Static"
  sku                                               = "Standard"	
}