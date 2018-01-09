
#########################################################################
#Create system disk from image, the disk will be encripted by default cmk
#Please aware, it is not supported to using a customized key for encription
#when we create a volume from image
#You can refer to OTC help center for detail.
#########################################################################

resource "opentelekomcloud_blockstorage_volume_v2" "grid-engine-sys-vol" {
  count    = "${var.engine_count}"
  name     = "win-engine-sys-vol-${count.index}"
  size     = 30
  image_id = "${var.image_id}"
  availability_zone = "${var.availability_zone}"
  volume_type = "SSD"
  tags {
    ETYPE = "UAT"
    VTYPE = "System"
  }
}

