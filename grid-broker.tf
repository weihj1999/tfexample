###
#Create volume from image
###
resource "opentelekomcloud_blockstorage_volume_v2" "grid-broker-sys-vol" {
  count    = "${var.broker_count}"
  name     = "grid-broker-sys-vol-${count.index}"
  size     = 50
  image_id = "732b56f0-57d9-4b5b-8c9a-5bd8c8b76901"
  availability_zone = "eu-de-01"
  volume_type = "SATA"
}

resource "opentelekomcloud_compute_instance_v2" "grid-broker" {
  count           = "${var.broker_count}"
  name            = "grid-broker${count.index}"
  flavor_name     = "s1.4xlarge"
  key_pair        = "${opentelekomcloud_compute_keypair_v2.grid-terraform-key.name}"
  availability_zone = "eu-de-01"
  security_groups = [
    "${opentelekomcloud_compute_secgroup_v2.secgrp-grid.name}"
  ]

  network {
    uuid           = "${opentelekomcloud_networking_network_v2.grid-net.id}"
  }

  #boot from the vol which create from  "Enterprise_RedHat_7_latest"
  block_device {
    #uuid = "${opentelekomcloud_blockstorage_volume_v2.grid-broker-sys-vol${count.index)}.id}"
    uuid = "${element(opentelekomcloud_blockstorage_volume_v2.grid-broker-sys-vol.*.id,count.index)}"
    source_type           = "volume"
    boot_index            = 0
    destination_type      = "volume"
    delete_on_termination = true
  }
  depends_on = ["opentelekomcloud_blockstorage_volume_v2.grid-broker-sys-vol"]
}


