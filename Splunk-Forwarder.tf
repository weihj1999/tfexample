###
#Create volume from image
###
resource "opentelekomcloud_blockstorage_volume_v2" "mgmt-splunk-sys-vol" {
  count    = "${var.splunk_count}"
  name     = "mgmt-splunk-sys-vol-${count.index}"
  size     = 30
  image_id = "732b56f0-57d9-4b5b-8c9a-5bd8c8b76901"
  availability_zone = "eu-de-01"
  volume_type = "SATA"
}

resource "opentelekomcloud_compute_instance_v2" "mgmt-splunk" {
  count           = "${var.splunk_count}"
  name            = "mgmt-splunk${count.index}"
  flavor_name     = "c1.large"
  key_pair        = "${opentelekomcloud_compute_keypair_v2.grid-terraform-key.name}"
  availability_zone = "eu-de-01"
  security_groups = [
    "${opentelekomcloud_compute_secgroup_v2.secgrp-mgmt.name}"
  ]

  network {
    uuid           = "${opentelekomcloud_networking_network_v2.mgmt-net.id}"
  }

  block_device {
    uuid = "${element(opentelekomcloud_blockstorage_volume_v2.mgmt-splunk-sys-vol.*.id,count.index)}"
    source_type           = "volume"
    boot_index            = 0
    destination_type      = "volume"
    delete_on_termination = true
  }
  depends_on = ["opentelekomcloud_blockstorage_volume_v2.mgmt-splunk-sys-vol"]
}


