###############################################################
# Define security group rule for front-end service
# Please change the default rule accroding to you secure requirement
###############################################################

resource "opentelekomcloud_networking_secgroup_v2" "elb-sg" {
  name        = "${var.project}-elb"
  description = "security group for elb"
}

resource "opentelekomcloud_networking_secgroup_rule_v2" "elb-port-sgrule" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 80
  port_range_max    = 80
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${opentelekomcloud_networking_secgroup_v2.elb-sg.id}"
}

