#########################################################################
#Create system disk from image, the disk will be encripted by default cmk
#Please aware, it is not supported to using a customized key for encription
#when we create a volume from image
#You can refer to OTC help center for detail.
#########################################################################
resource "opentelekomcloud_blockstorage_volume_v2" "fe-jumphost-sys-vol" {
  count    = "${var.jumphost_count}"
  name     = "fe-jumphost-sys-vol-${count.index}"
  size     = 50
  image_id = "732b56f0-57d9-4b5b-8c9a-5bd8c8b76901"
  availability_zone = "eu-de-01"
  volume_type = "SATA"
}

resource "opentelekomcloud_compute_instance_v2" "fe-jumphost" {
  count           = "${var.jumphost_count}"
  name            = "fe-jumphost-${count.index}"
  flavor_name     = "c1.large"
  key_pair        = "${opentelekomcloud_compute_keypair_v2.grid-terraform-key.name}"
  availability_zone = "eu-de-01"
  security_groups = [
    "${opentelekomcloud_compute_secgroup_v2.secgrp-fe.name}"
  ]

  network {
    uuid           = "${opentelekomcloud_networking_network_v2.fe-net.id}"
  }
  block_device {
    uuid = "${element(opentelekomcloud_blockstorage_volume_v2.fe-jumphost-sys-vol.*.id,count.index)}"
    source_type           = "volume"
    boot_index            = 0
    destination_type      = "volume"
    delete_on_termination = true
  }
   depends_on = ["opentelekomcloud_networking_router_v2.grid-vpc", "opentelekomcloud_networking_subnet_v2.grid-subnet","opentelekomcloud_blockstorage_volume_v2.fe-jumphost-sys-vol"]
}


