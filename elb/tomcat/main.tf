
resource "opentelekomcloud_blockstorage_volume_v2" "az01-webtomcat-sys-vol" {
  count    = "${var.count}"
  name     = "az01-webtomcat-sys-vol-${count.index}"
  size     = 10
  image_id = "${var.image_id}"
  availability_zone = "${var.availability_zone}"
  volume_type = "SATA"
  tags {
    ETYPE = "UAT"
    VTYPE = "System"
  }
}

resource "opentelekomcloud_compute_instance_v2" "az01-webtomcat" {
   count           = "${var.count}"
   name            = "webtomcat${count.index}"
   flavor_name     = "${var.flavor_name}"
   key_pair        = "nor"
   availability_zone = "${var.availability_zone}"
   security_groups = ["default"]
   
   tags = ["ETYPE.UAT","OS.CentOS73"]

   network {
     uuid           = "${var.existing_private_net_id}"
   }

   block_device {
     uuid = "${element(opentelekomcloud_blockstorage_volume_v2.az01-webtomcat-sys-vol.*.id,count.index)}"
     source_type           = "volume"
     boot_index            = 0
     destination_type      = "volume"
     delete_on_termination = false
   }
   depends_on = ["opentelekomcloud_blockstorage_volume_v2.az01-webtomcat-sys-vol","opentelekomcloud_elb_loadbalancer.tomcat_elb"]
   provisioner "local-exec" {
     command = "sleep 60 && echo -e \"[server]\n${self.network.0.fixed_ip_v4} ansible_ssh_private_key_file=~/.ssh/id_rsa\" >> /home/linux/elb/tomcat/hosts && ansible-playbook -i /home/linux/elb/tomcat/hosts /home/linux/elb/tomcat/site.yml -vv"
  }
}

resource "opentelekomcloud_elb_loadbalancer" "tomcat_elb" {
  name = "tomcat-elb"
  description = "elb for tomcat(internal)"
  type = "Internal"
  security_group_id = "${var.security_group_id}"
  vpc_id = "${var.vpc_id}"
  #vip_subnet_id = "${var.existing_subnet_id}"
  vip_subnet_id = "${var.existing_private_net_id}"
  admin_state_up = 1
}


resource "opentelekomcloud_elb_listener" "tomcat_listener" {
  name             = "tomcat_listener"
  protocol         = "TCP"
  protocol_port    = 80
  backend_protocol = "TCP"
  backend_port     = 8080
  lb_algorithm     = "roundrobin"
  loadbalancer_id  = "${opentelekomcloud_elb_loadbalancer.tomcat_elb.id}"
}

resource "opentelekomcloud_elb_health" "tomcat_health" {
  listener_id = "${opentelekomcloud_elb_listener.tomcat_listener.id}"
  healthcheck_protocol = "HTTP"
  healthy_threshold = 5
  healthcheck_timeout = 25
  healthcheck_interval = 3
  healthcheck_uri = "/"
  timeouts {
    create = "5m"
    update = "5m"
    delete = "5m"
  }
  depends_on =["opentelekomcloud_elb_listener.tomcat_listener"]
}

resource "opentelekomcloud_elb_backend" "tomcat_backend" {
  count = "${var.count}"
  address = "${element(opentelekomcloud_compute_instance_v2.az01-webtomcat.*.access_ip_v4, count.index)}"
  listener_id = "${opentelekomcloud_elb_listener.tomcat_listener.id}"
  server_id = "${element(opentelekomcloud_compute_instance_v2.az01-webtomcat.*.id, count.index)}"
  depends_on =["opentelekomcloud_elb_listener.tomcat_listener"]
}

