resource "opentelekomcloud_blockstorage_volume_v2" "az01-bas01-sys-vol" {
  count    = "${var.bastion_count}"
  name     = "az01-bas01-sys-vol-${count.index}"
  size     = 80
  image_id = "${var.image_id}"
  availability_zone = "${var.availability_zone}"
  volume_type = "SATA"
  tags {
    appcode = "DGSR"
    namecode = "TomMann"
  }
  scheduler_hints {
    host = "pod04.eu-de-01"
  }
}

resource "opentelekomcloud_blockstorage_volume_v2" "az01-bas01-data-vol" {
   count = "${var.bastion_count}"
   name  = "winaz01-bas01-data-vol-${count.index}"
   size  = "100"
   volume_type = "SATA"
   availability_zone = "${var.availability_zone}"
   metadata = {
     "__system__encrypted" = 1
     "__system__cmkid" = "${var.kms_vol_key}"
   }
   tags {
     appcode = "DGSR"
     namecode = "TomMann"
   }
}

resource "opentelekomcloud_compute_instance_v2" "az01-bas01" {
   count           = "${var.bastion_count}"
   name            = "winaz01-bas01${count.index}"
   flavor_name     = "${var.flavor_name}"
   key_pair        = "nor"
   availability_zone = "${var.availability_zone}"
   security_groups = ["default"]
   #user_data = "${file("/home/linux/dns/bas01/user-data.cmd")}"
   user_data = "#ps1\nGet-NetAdapter\nnet user ansible Test1234+ /add\nnet localgroup administrators ansible /add\n#ps1\nGet-NetAdapter -name 'Local Area Connection' | Set-DnsClient -ConnectionSpecificSuffix otc.nortst.com -RegisterThisConnectionsAddress:$true -UseSuffixWhenRegistering:$true\nSet-NetFirewallProfile -Profile Domain,Public,Private -Enabled False "
   
   tags = ["appcode.DGSR","namecode.\"Tom Mann\""]

   network {
     uuid           = "${var.existing_private_net_id}"
   }

   block_device {
     uuid = "${element(opentelekomcloud_blockstorage_volume_v2.az01-bas01-sys-vol.*.id,count.index)}"
     source_type           = "volume"
     boot_index            = 0
     destination_type      = "volume"
     delete_on_termination = false
   }
   depends_on = ["opentelekomcloud_blockstorage_volume_v2.az01-bas01-sys-vol"]
   provisioner "local-exec" {
     command = "echo Running provisioner on ${self.name} IP addr ${self.network.0.fixed_ip_v4}\nCOUNT=0; while ! echo exit | telnet ${self.network.0.fixed_ip_v4} 5986 | grep Connected; do sleep 10; echo $(( COUNT++ )); if [ $COUNT -gt 10 ]; then exit 0; fi; done && echo Running command"

  }
   
}

resource "opentelekomcloud_compute_volume_attach_v2" "bas01_volume_attach" {
   count       = "${var.bastion_count}"
   instance_id = "${element(opentelekomcloud_compute_instance_v2.az01-bas01.*.id, count.index)}"
   volume_id   = "${element(opentelekomcloud_blockstorage_volume_v2.az01-bas01-data-vol.*.id, count.index)}"
   depends_on = ["opentelekomcloud_compute_instance_v2.az01-bas01","opentelekomcloud_blockstorage_volume_v2.az01-bas01-data-vol"]
}

resource "dns_a_record_set" "otc_bas01_nortst_com" {
  count = "${var.bastion_count}"
  zone = "otc.nortst.com."
  name = "${element(opentelekomcloud_compute_instance_v2.az01-bas01.*.name, count.index)}"
  addresses = [
    "${element(opentelekomcloud_compute_instance_v2.az01-bas01.*.access_ip_v4, count.index)}"
  ]
  ttl = 3000
}

