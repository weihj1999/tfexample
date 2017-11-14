###
#Create volume from image
###
resource "opentelekomcloud_blockstorage_volume_v2" "data-filer-sys-vol" {
  count    = "${var.filer_count}"
  name     = "data-filer-sys-vol-${count.index}"
  size     = 30
  image_id = "732b56f0-57d9-4b5b-8c9a-5bd8c8b76901"
  availability_zone = "eu-de-02"
  volume_type = "SATA"
}

resource "opentelekomcloud_compute_instance_v2" "data-filer" {
  count           = "${var.filer_count}"
  name            = "data-filer${count.index}"
  flavor_name     = "c2.large"
  key_pair        = "${opentelekomcloud_compute_keypair_v2.grid-terraform-key.name}"
  availability_zone = "eu-de-02"
  security_groups = [
    "${opentelekomcloud_compute_secgroup_v2.secgrp-data.name}"
  ]

  network {
    uuid           = "${opentelekomcloud_networking_network_v2.data-net.id}"
  }

  block_device {
    uuid = "${element(opentelekomcloud_blockstorage_volume_v2.data-filer-sys-vol.*.id,count.index)}"
    source_type           = "volume"
    boot_index            = 0
    destination_type      = "volume"
    delete_on_termination = true
  }

  block_device {
    source_type           = "blank"
    destination_type      = "volume"
    volume_size           = 200
    boot_index            = 1
    delete_on_termination = true
  }
  depends_on = ["opentelekomcloud_networking_router_v2.grid-vpc", "opentelekomcloud_networking_subnet_v2.grid-subnet","opentelekomcloud_blockstorage_volume_v2.data-filer-sys-vol"]
}


