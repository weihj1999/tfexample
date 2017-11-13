########################################################
# 1. Create a VPC
#
########################################################
resource "opentelekomcloud_networking_router_v2" "grid-vpc" {
  name             = "grid-vpc"
  admin_state_up   = "true"
  external_gateway = "0a2228f2-7f8a-45f1-8e09-9039e1d09975"
}

########################################################
# 2 Create a subnet for gateway
# This is the subnet which connects the Gateway services to 
# the internal systems. VPN to the Firewall for example
########################################################

resource "opentelekomcloud_networking_network_v2" "gateway-net" {
  name           = "gateway-net"
  admin_state_up = "true"
}

resource "opentelekomcloud_networking_subnet_v2" "gateway-subnet" {
  name            = "gateway-subnet"
  network_id      = "${opentelekomcloud_networking_network_v2.gateway-net.id}"
  cidr            = "192.168.0.0/24"
  ip_version      = 4
  dns_nameservers = ["100.125.4.25","8.8.8.8", "8.8.4.4"]
}

resource "opentelekomcloud_networking_router_interface_v2" "gateway-int" {
  router_id = "${opentelekomcloud_networking_router_v2.grid-vpc.id}"
  subnet_id = "${opentelekomcloud_networking_subnet_v2.gateway-subnet.id}"
}

########################################################
# 3. Create a subnet for mgmt
# This subnet hauses the manament systems such as Splunk Forwarder
########################################################
resource "opentelekomcloud_networking_network_v2" "mgmt-net" {
  name           = "mgmt-net"
  admin_state_up = "true"
}

resource "opentelekomcloud_networking_subnet_v2" "mgmt-subnet" {
  name            = "mgmt-subnet"
  network_id      = "${opentelekomcloud_networking_network_v2.mgmt-net.id}"
  cidr            = "192.168.1.0/24"
  ip_version      = 4
  dns_nameservers = ["100.125.4.25","8.8.8.8", "8.8.4.4"]
}

resource "opentelekomcloud_networking_router_interface_v2" "mgmt-int" {
  router_id = "${opentelekomcloud_networking_router_v2.grid-vpc.id}"
  subnet_id = "${opentelekomcloud_networking_subnet_v2.mgmt-subnet.id}"
}

########################################################
# 4. Create a subnet for grid
# all the Grid components will be isolate in this subnet
########################################################
resource "opentelekomcloud_networking_network_v2" "grid-net" {
  name           = "grid-net"
  admin_state_up = "true"
}

resource "opentelekomcloud_networking_subnet_v2" "grid-subnet" {
  name            = "grid-subnet"
  network_id      = "${opentelekomcloud_networking_network_v2.grid-net.id}"
  cidr            = "192.168.2.0/24"
  ip_version      = 4
  dns_nameservers = ["100.125.4.25","8.8.8.8", "8.8.4.4"]
}

resource "opentelekomcloud_networking_router_interface_v2" "grid-int" {
  router_id = "${opentelekomcloud_networking_router_v2.grid-vpc.id}"
  subnet_id = "${opentelekomcloud_networking_subnet_v2.grid-subnet.id}"
}
########################################################
# 5. Create a subnet for FE
# this subnet houses the Bastian Jump Host and is the internal interface to the Firewall
########################################################

resource "opentelekomcloud_networking_network_v2" "fe-net" {
  name           = "fe-net"
  admin_state_up = "true"
}

resource "opentelekomcloud_networking_subnet_v2" "fe-subnet" {
  name            = "fe-subnet"
  network_id      = "${opentelekomcloud_networking_network_v2.fe-net.id}"
  cidr            = "192.168.3.0/24"
  ip_version      = 4
  dns_nameservers = ["100.125.4.25","8.8.8.8", "8.8.4.4"]
}

resource "opentelekomcloud_networking_router_interface_v2" "fe-int" {
  router_id = "${opentelekomcloud_networking_router_v2.grid-vpc.id}"
  subnet_id = "${opentelekomcloud_networking_subnet_v2.fe-subnet.id}"
}

########################################################
# 6. Create a subnet for data
# this subnet house the Filer service cluster (One node in each AZ)
resource "opentelekomcloud_networking_network_v2" "data-net" {
  name           = "data-net"
  admin_state_up = "true"
}

resource "opentelekomcloud_networking_subnet_v2" "data-subnet" {
  name            = "data-subnet"
  network_id      = "${opentelekomcloud_networking_network_v2.data-net.id}"
  cidr            = "192.168.4.0/24"
  ip_version      = 4
  dns_nameservers = ["100.125.4.25","8.8.8.8", "8.8.4.4"]
}

resource "opentelekomcloud_networking_router_interface_v2" "data-int" {
  router_id = "${opentelekomcloud_networking_router_v2.grid-vpc.id}"
  subnet_id = "${opentelekomcloud_networking_subnet_v2.data-subnet.id}"
}

