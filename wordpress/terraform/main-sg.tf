###############################################################
# Define security group rule for front-end service
# Please change the default rule accroding to you secure requirement
###############################################################

resource "opentelekomcloud_networking_secgroup_v2" "main-sg" {
  name        = "${var.project}-mainsg"
  description = "security group for front-end service"
}

resource "opentelekomcloud_networking_secgroup_rule_v2" "nginx-sgrule" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = "${var.nginx_port}"
  port_range_max    = "${var.nginx_port}"
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${opentelekomcloud_networking_secgroup_v2.main-sg.id}"
}

resource "opentelekomcloud_networking_secgroup_rule_v2" "ssh-sgrule" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${opentelekomcloud_networking_secgroup_v2.main-sg.id}"
}

resource "opentelekomcloud_networking_secgroup_rule_v2" "icmp-sgrule" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "icmp"
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${opentelekomcloud_networking_secgroup_v2.main-sg.id}"
}

