###############################################################
# Define security group rule for front-end service
# Please change the default rule accroding to you secure requirement
###############################################################

resource "opentelekomcloud_networking_secgroup_v2" "secgrp_mgmt" {
  name        = "secgrp-mgmt"
  description = "security group for front-end service"
}

resource "opentelekomcloud_networking_secgroup_rule_v2" "secgroup_rule_mgmt_ssh" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${opentelekomcloud_networking_secgroup_v2.secgrp_mgmt.id}"
}

resource "opentelekomcloud_networking_secgroup_rule_v2" "secgroup_rule_mgmt_rdp" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 3389
  port_range_max    = 3389
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${opentelekomcloud_networking_secgroup_v2.secgrp_mgmt.id}"
}

resource "opentelekomcloud_networking_secgroup_rule_v2" "secgroup_rule_mgmt_https" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 443
  port_range_max    = 443
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${opentelekomcloud_networking_secgroup_v2.secgrp_mgmt.id}"
}

resource "opentelekomcloud_networking_secgroup_rule_v2" "secgroup_rule_mgmt_icmp" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "icmp"
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${opentelekomcloud_networking_secgroup_v2.secgrp_mgmt.id}"
}

