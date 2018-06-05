resource "dns_a_record_set" "LoadBalancer_dns" {
  count     = "1"
  zone      = "${var.DNSzone}"                                                  #
  name      = "${opentelekomcloud_elb_loadbalancer.LoadBalancer.name}"
  addresses = ["${opentelekomcloud_elb_loadbalancer.LoadBalancer.vip_address}"]
}

#Creates the machine
resource "opentelekomcloud_elb_loadbalancer" "LoadBalancer" {
  count             = "1"
  name              = "LoadBalancer_splunk_tomsTest"
  description       = "LoadBalancer for Splunk"
  type              = "Internal"
  security_group_id = "${lookup(var.Security_group_ID,var.Environment )}"
  vpc_id            = "${lookup(var.existing_vpc_id,var.Environment )}"
  vip_subnet_id     = "${lookup(var.existing_subnet_id,var.Environment )}"
  #vip_address       = "10.62.92.200"
  admin_state_up    = 1
}

resource "opentelekomcloud_elb_listener" "splunk_listener" {
  name             = "splunk_listener"
  protocol         = "TCP"
  protocol_port    = 8080
  backend_protocol = "TCP"
  backend_port     = 8080
  lb_algorithm     = "roundrobin"
  loadbalancer_id  = "${opentelekomcloud_elb_loadbalancer.LoadBalancer.id}"
}

resource "opentelekomcloud_elb_health" "splunk_health" {
  listener_id          = "${opentelekomcloud_elb_listener.splunk_listener.id}"
  healthcheck_protocol = "HTTP"
  healthy_threshold    = 5
  healthcheck_timeout  = 25
  healthcheck_interval = 3
  healthcheck_uri      = "/"

  timeouts {
    create = "5m"
    update = "5m"
    delete = "5m"
  }

  depends_on = ["opentelekomcloud_elb_listener.splunk_listener"]
}

resource "opentelekomcloud_elb_backend" "splunk_servers_to_point_to" {
  count       = "${var.splunk_server_count}"
  address     = "${element(opentelekomcloud_compute_instance_v2.splunk.*.access_ip_v4, count.index)}"
  listener_id = "${opentelekomcloud_elb_listener.splunk_listener.id}"
  server_id   = "${element(opentelekomcloud_compute_instance_v2.splunk.*.id, count.index)}"
  depends_on  = ["opentelekomcloud_elb_listener.splunk_listener"]
}

