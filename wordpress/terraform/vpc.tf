resource "opentelekomcloud_networking_router_v2" "wp-vpc" {
  name 		= "${var.project}-vpc"
  admin_state_up	= "true"
  external_gateway	= "0a2228f2-7f8a-45f1-8e09-9039e1d09975"
}

resource "opentelekomcloud_networking_router_interface_v2" "wp-interface" {
  router_id	= "${opentelekomcloud_networking_router_v2.wp-vpc.id}"
  subnet_id 	= "${opentelekomcloud_networking_subnet_v2.wp-subnet.id}"
  depends_on 	= ["opentelekomcloud_networking_subnet_v2.wp-subnet"]
}

resource "opentelekomcloud_networking_network_v2" "wp-net" {
  name		= "${var.project}-net"
  admin_state_up	= "true"
}

resource "opentelekomcloud_networking_subnet_v2" "wp-subnet" {
  name          = "${var.project}-subnet"
  network_id	= "${opentelekomcloud_networking_network_v2.wp-net.id}"
  cidr		= "${var.subnet_cidr}"
  ip_version	= 4
  dns_nameservers= ["8.8.8.8","8.8.4.4","100.125.4.25"]
}

