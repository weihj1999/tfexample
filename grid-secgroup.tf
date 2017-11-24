###############################################################
# Define security group rule for front-end service
# Please change the default rule accroding to you secure requirement
###############################################################

resource "opentelekomcloud_networking_secgroup_v2" "secgrp_grid" {
  name        = "secgrp-grid"
  description = "security group for front-end service"
}

resource "opentelekomcloud_networking_secgroup_rule_v2" "secgroup_rule_grid_ssh" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${opentelekomcloud_networking_secgroup_v2.secgrp_grid.id}"
}

resource "opentelekomcloud_networking_secgroup_rule_v2" "secgroup_rule_grid_http" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 80
  port_range_max    = 80
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${opentelekomcloud_networking_secgroup_v2.secgrp_grid.id}"
}

resource "opentelekomcloud_networking_secgroup_rule_v2" "secgroup_rule_grid_icmp" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "icmp"
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${opentelekomcloud_networking_secgroup_v2.secgrp_grid.id}"
}

