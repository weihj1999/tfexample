###############################################################
# Define security group rule for front-end service
# Please change the default rule accroding to you secure requirement
###############################################################

resource "opentelekomcloud_networking_secgroup_v2" "secgrp_data" {
  name        = "secgrp-data"
  description = "security group for front-end service"
}

resource "opentelekomcloud_networking_secgroup_rule_v2" "secgroup_rule_data_ssh" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${opentelekomcloud_networking_secgroup_v2.secgrp_data.id}"
}

resource "opentelekomcloud_networking_secgroup_rule_v2" "secgroup_rule_data_mount" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 111
  port_range_max    = 111
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${opentelekomcloud_networking_secgroup_v2.secgrp_data.id}"
}

resource "opentelekomcloud_networking_secgroup_rule_v2" "secgroup_rule_data_nfsd" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 2049
  port_range_max    = 2049
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${opentelekomcloud_networking_secgroup_v2.secgrp_data.id}"
}

resource "opentelekomcloud_networking_secgroup_rule_v2" "secgroup_rule_data_icmp" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "icmp"
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${opentelekomcloud_networking_secgroup_v2.secgrp_data.id}"
}



