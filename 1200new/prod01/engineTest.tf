
#########################################################################
#Create system disk from image, the disk will be encripted by default cmk
#Please aware, it is not supported to using a customized key for encription
#when we create a volume from image
#You can refer to OTC help center for detail.
#########################################################################

resource "opentelekomcloud_blockstorage_volume_v2" "az01-grid-engine-sys-vol" {
  count    = "${var.engine_count}"
  name     = "az01-win-engine-sys-vol-${count.index}"
  size     = 80
  image_id = "${var.image_id}"
  availability_zone = "${var.availability_zone}"
  #volume_type = "SSD"
  volume_type = "SATA"
  tags {
    ETYPE = "UAT"
    VTYPE = "System"
  }
}
 ##################################################################
 #Create a blank volume
 #__system__encrypted and __system__cmkid are used for encription
 #Please ensure xrole is created to get a default key, and refer to
 #https://docs.otc.t-systems.com/en-us/usermanual/evs/en-us_topic_0021738346.html
 ###################################################################

resource "opentelekomcloud_blockstorage_volume_v2" "az01-grid-engine-data-vol" {
   count = "${var.engine_count}"
   name  = "win-engine-data-vol-${count.index}"
   size  = "100"
   #volume_type = "SSD"
   volume_type = "SATA"
   availability_zone = "${var.availability_zone}"
   metadata = {
     "__system__encrypted" = 1
     "__system__cmkid" = "${var.kms_vol_key}"
   }
   tags {
     ETYPE = "UAT"
     VTYPE = "System"
   }


}

resource "opentelekomcloud_compute_instance_v2" "az01-grid-engine" {
   count           = "${var.engine_count}"
   name            = "winaz01-engine${count.index}"
   flavor_name     = "${var.flavor_name}"
   key_pair        = "nor"
   availability_zone = "${var.availability_zone}"
   security_groups = ["default"]
   #user_data = "${file("/home/linux/cloudtf/winnor1/user-data.cmd")}"
   #user_data = "#ps1\nGet-NetAdapter\nnet user ansible Test1234+ /add\nnet localgroup administrators ansible /add\n#ps1\nGet-NetAdapter -name 'Local Area Connection' | Set-DnsClient -ConnectionSpecificSuffix otc.nortst.com -RegisterThisConnectionsAddress:$true -UseSuffixWhenRegistering:$true\nSet-NetFirewallProfile -Profile Domain,Public,Private -Enabled False "
   user_data = "rem cmd net user ansible Nordea2017 /add net localgroup administrators ansible /add NetSh Advfirewall set allprofiles state off #ps1 Get-NetAdapter -name 'Local Area Connection' | Set-DnsClient -ConnectionSpecificSuffix otc.nortst.com -RegisterThisConnectionsAddress:$true -UseSuffixWhenRegistering:$true"
   tags = ["ETYPE.UAT","OS.Windows2012"]

   network {
     uuid           = "${var.existing_private_net_id}"
   }

   block_device {
     uuid = "${element(opentelekomcloud_blockstorage_volume_v2.az01-grid-engine-sys-vol.*.id,count.index)}"
     source_type           = "volume"
     boot_index            = 0
     destination_type      = "volume"
     delete_on_termination = false
   }
   depends_on = ["opentelekomcloud_blockstorage_volume_v2.az01-grid-engine-sys-vol"]
   provisioner "local-exec" {
    command = "echo Running provisioner on ${self.name} IP addr ${self.network.0.fixed_ip_v4}\nCOUNT=0; while ! echo exit | telnet ${self.network.0.fixed_ip_v4} 5986 | grep Connected; do sleep 10; echo $(( COUNT++ )); if [ $COUNT -gt 10 ]; then exit 0; fi; done && echo Running command"

  }
}

resource "opentelekomcloud_compute_volume_attach_v2" "engine_volume_attach" {
   count       = "${var.engine_count}"
   instance_id = "${element(opentelekomcloud_compute_instance_v2.az01-grid-engine.*.id, count.index)}"
   volume_id   = "${element(opentelekomcloud_blockstorage_volume_v2.az01-grid-engine-data-vol.*.id, count.index)}"
   depends_on = ["opentelekomcloud_compute_instance_v2.az01-grid-engine","opentelekomcloud_blockstorage_volume_v2.az01-grid-engine-data-vol"]
}

resource "dns_a_record_set" "otc_prod01_nortst_com" {
  count = "${var.engine_count}"
  zone = "otc.nortst.com."
  name = "${element(opentelekomcloud_compute_instance_v2.az01-grid-engine.*.name, count.index)}"
  addresses = [
    "${element(opentelekomcloud_compute_instance_v2.az01-grid-engine.*.access_ip_v4, count.index)}"
  ]
  ttl = 3000
}

