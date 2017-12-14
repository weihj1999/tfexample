provider "opentelekomcloud" {
  user_name   = "${var.username}"
  password    = "${var.password}"
  tenant_name = "${var.tenant_name}"
  domain_name = "${var.domain_name}"
  auth_url    = "${var.endpoint}"
}

#########################################################################
#Create system disk from image, the disk will be encripted by default cmk
#Please aware, it is not supported to using a customized key for encription
#when we create a volume from image
#You can refer to OTC help center for detail.
#########################################################################

resource "opentelekomcloud_blockstorage_volume_v2" "grid-engine-sys-vol" {
  count    = "${var.engine_count}"
  name     = "grid-engine-sys-vol-${count.index}"
  size     = 30
  image_id = "b5cd010e-99f1-4d7c-878b-4f967bcae472"
  availability_zone = "${var.availability_zone}"
  volume_type = "SSD"
 }

 ##################################################################
 #Create a blank volume
 #__system__encrypted and __system__cmkid are used for encription
 #Please ensure xrole is created to get a default key, and refer to
 #https://docs.otc.t-systems.com/en-us/usermanual/evs/en-us_topic_0021738346.html
 ###################################################################

 resource "opentelekomcloud_blockstorage_volume_v2" "grid-engine-data-vol" {
   count = "${var.engine_count}"
   name  = "grid-engine-data-vol-${count.index}"
   size  = "10"
   volume_type = "SSD"
   availability_zone = "${var.availability_zone}"
   metadata = {
     "__system__encrypted" = 1
     "__system__cmkid" = "${var.kms_vol_key}"
   }
 }

 resource "opentelekomcloud_compute_instance_v2" "grid-engine" {
   count           = "${var.engine_count}"
   name            = "grid-engine${count.index}"
   #flavor_name     = "s1.4xlarge"
   flavor_name     = "${var.flavor_name}"
   key_pair        = "key4VPN"
   availability_zone = "${var.availability_zone}"
   security_groups = ["default"]
   
#   tags = ["ETYPE.UAT"]

   network {
     uuid           = "${var.existing_subnet_id}"
   }

   block_device {
     uuid = "${element(opentelekomcloud_blockstorage_volume_v2.grid-engine-sys-vol.*.id,count.index)}"
     source_type           = "volume"
     boot_index            = 0
     destination_type      = "volume"
     delete_on_termination = true
   }
   depends_on = ["opentelekomcloud_blockstorage_volume_v2.grid-engine-sys-vol"]
 }
 resource "opentelekomcloud_compute_volume_attach_v2" "engine_volume_attach" {
   count       = "${var.engine_count}"
   instance_id = "${element(opentelekomcloud_compute_instance_v2.grid-engine.*.id, count.index)}"
   volume_id   = "${element(opentelekomcloud_blockstorage_volume_v2.grid-engine-data-vol.*.id, count.index)}"
   depends_on = ["opentelekomcloud_compute_instance_v2.grid-engine","opentelekomcloud_blockstorage_volume_v2.grid-engine-data-vol"]
 }
