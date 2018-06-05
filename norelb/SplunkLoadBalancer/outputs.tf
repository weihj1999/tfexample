output "elb_ip" {
    value = "${opentelekomcloud_elb_loadbalancer.LoadBalancer.vip_address}"
}
