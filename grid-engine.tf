###
#Create volume from image
###
resource "opentelekomcloud_blockstorage_volume_v2" "grid-engine-sys-vol" {
  count    = "${var.engine_count}"
  name     = "grid-engine-sys-vol-${count.index}"
  size     = 30
  image_id = "b5cd010e-99f1-4d7c-878b-4f967bcae472"
  availability_zone = "eu-de-02"
  volume_type = "SATA"
}

resource "opentelekomcloud_compute_instance_v2" "grid-engine" {
  count           = "${var.engine_count}"
  name            = "grid-engine${count.index}"
  flavor_name     = "s1.4xlarge"
  key_pair        = "${opentelekomcloud_compute_keypair_v2.grid-terraform-key.name}"
  availability_zone = "eu-de-02"
  security_groups = [
    "${opentelekomcloud_compute_secgroup_v2.secgrp-grid.name}"
  ]

  network {
    uuid           = "${opentelekomcloud_networking_network_v2.grid-net.id}"
  }

  block_device {
    uuid = "${element(opentelekomcloud_blockstorage_volume_v2.grid-engine-sys-vol.*.id,count.index)}"
    source_type           = "volume"
    boot_index            = 0
    destination_type      = "volume"
    delete_on_termination = true
  }

  block_device {
    source_type           = "blank"
    destination_type      = "volume"
    volume_size           = 10
    boot_index            = 1
    delete_on_termination = true
  }
  depends_on = ["opentelekomcloud_networking_router_v2.grid-vpc", "opentelekomcloud_networking_subnet_v2.grid-subnet","opentelekomcloud_blockstorage_volume_v2.grid-engine-sys-vol"]
}


