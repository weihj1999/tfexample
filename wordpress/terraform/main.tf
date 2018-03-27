resource "opentelekomcloud_compute_keypair_v2" "wp_key" {
  name = "${var.project}-key"
  public_key = "${file("${var.ssh_pub_key}")}"
}

resource "opentelekomcloud_compute_instance_v2" "wpserver" {
  count		= "${var.num_server}"
  name		= "${var.project}-wpserver-${format("%02d",count.index+1)}"
  image_name	= "${var.image_name}"
  flavor_name	= "${var.flavor_name}"
  security_groups	= [
    "${opentelekomcloud_networking_secgroup_v2.main-sg.name}"
  ]
  network {
    uuid = "${opentelekomcloud_networking_network_v2.wp-net.id}"
  }
  depends_on    = ["opentelekomcloud_networking_subnet_v2.wp-subnet"]
}

resource "opentelekomcloud_lb_loadbalancer_v2" "wp-lb" {
  name		= "${var.project}-wplb"
  vip_subnet_id = "${opentelekomcloud_networking_subnet_v2.wp-subnet.id}"
  admin_state_up = "true"
  depends_on	= ["opentelekomcloud_networking_router_interface_v2.wp-interface"]
}

resource "opentelekomcloud_lb_listener_v2" "wp-listener" {
  name		  = "${var.project}-listner"
  protocol        = "HTTP"
  protocol_port   = "${var.listener_port}"
  loadbalancer_id = "${opentelekomcloud_lb_loadbalancer_v2.wp-lb.id}"
}

resource "opentelekomcloud_lb_pool_v2" "wp-pool" {
  protocol    = "HTTP"
  lb_method   = "ROUND_ROBIN"
  listener_id = "${opentelekomcloud_lb_listener_v2.wp-listener.id}"
}

resource "opentelekomcloud_lb_monitor_v2" "wp-monitor" {
  pool_id     = "${opentelekomcloud_lb_pool_v2.wp-pool.id}"
  type        = "PING"
  delay       = 20
  timeout     = 10
  max_retries = 5
}

resource "opentelekomcloud_lb_member_v2" "wp-member" {
  count         = "${var.num_server}"
  address       = "${element(opentelekomcloud_compute_instance_v2.wpserver.*.access_ip_v4, count.index)}"
  pool_id       = "${opentelekomcloud_lb_pool_v2.wp-pool.id}"
  subnet_id     = "${opentelekomcloud_networking_subnet_v2.wp-subnet.id}"
  protocol_port = "${var.nginx_port}"
}

