
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
   depends_on = ["opentelekomcloud_blockstorage_volume_v2.az01-webtomcat-sys-vol"]
   provisioner "local-exec" {
     command = "sleep 60 && echo -e \"[server]\n${self.network.0.fixed_ip_v4} ansible_ssh_private_key_file=~/.ssh/id_rsa\" > /home/linux/tomcat/hosts && ansible-playbook -i /home/linux/tomcat/hosts /home/linux/tomcat/site.yml -vv"
  }
}

