###############################################################
# Define security group rule for front-end service
# Please change the default rule accroding to you secure requirement
###############################################################

resource "opentelekomcloud_networking_secgroup_v2" "secgrp_dmz_zone" {
  name        = "secgrp-dmz_zone"
  description = "security group for front-end service"
}

resource "opentelekomcloud_networking_secgroup_rule_v2" "secgroup_rule_dmz_zone_ssh" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${opentelekomcloud_networking_secgroup_v2.secgrp_dmz_zone.id}"
}

resource "opentelekomcloud_networking_secgroup_rule_v2" "secgroup_rule_dmz_zone_http" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 80
  port_range_max    = 80
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${opentelekomcloud_networking_secgroup_v2.secgrp_dmz_zone.id}"
}

resource "opentelekomcloud_networking_secgroup_rule_v2" "secgroup_rule_dmz_zone_https" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 443
  port_range_max    = 443
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${opentelekomcloud_networking_secgroup_v2.secgrp_dmz_zone.id}"
}

resource "opentelekomcloud_networking_secgroup_rule_v2" "secgroup_rule_dmz_zone_icmp" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "icmp"
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${opentelekomcloud_networking_secgroup_v2.secgrp_dmz_zone.id}"
}

resource "opentelekomcloud_networking_secgroup_rule_v2" "secgroup_rule_dmz_zone_ntp" {
  direction         = "egress"
  ethertype         = "IPv4"
  port_range_min    = 123
  port_range_max    = 123
  protocol          = "tcp"
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${opentelekomcloud_networking_secgroup_v2.secgrp_dmz_zone.id}"
}

