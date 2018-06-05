resource "dns_a_record_set" "splunk_dns" {
  count     = "${var.splunk_server_count}"
  zone      = "${var.DNSzone}"                                                                        #
  ttl       = "240"
  name      = "${element(opentelekomcloud_compute_instance_v2.splunk.*.name, count.index)}"
  addresses = ["${element(opentelekomcloud_compute_instance_v2.splunk.*.access_ip_v4, count.index)}"]
}

#Creates the machine
resource "opentelekomcloud_compute_instance_v2" "splunk" {
  count             = "${var.splunk_server_count}"
  name              = "${var.name_prefix}-C-${format("%02d", count.index+1)}"
  image_name        = "Enterprise_RedHat_7_latest"
  flavor_name       = "${var.Compute_type}"
  key_pair          = "nor1"
  availability_zone = "${var.Availability_zone}"

  #sets the network subnet to use
  network {
    uuid = "${lookup(var.existing_subnet_id,var.Environment )}"
  }

  tags = [
    "appCode.splunk",
    "costCenter.${var.Cost_Centre}",
    "environment.${var.Environment}",
    "Purpose.splunk",
    "systemOwner.Tom Mann",
    "project.Cloud-POC",
    "portfolio.SomePortfolio",
  ]

  #attach the OS volume
  block_device {
    uuid                  = "${element(opentelekomcloud_blockstorage_volume_v2.splunkOSvolume.*.id, count.index)}"
    source_type           = "volume"
    destination_type      = "volume"
    boot_index            = 0
    delete_on_termination = true
  }

  #attach the data volume
  block_device {
    uuid                  = "${element(opentelekomcloud_blockstorage_volume_v2.splunkDatavolume.*.id, count.index)}"
    source_type           = "volume"
    destination_type      = "volume"
    boot_index            = 1
    delete_on_termination = true
  }
}

#Create the data volume
resource "opentelekomcloud_blockstorage_volume_v2" "splunkDatavolume" {
  count             = "${var.splunk_server_count}"
  name              = "${var.name_prefix}_SDataDisk${format("%02d", count.index+1)}"
  size              = "${var.disk_size_gb}"
  availability_zone = "${var.Availability_zone}"

  tags = {
    "appCode"     = "splunk"
    "costCenter"  = "${var.Cost_Centre}"
    "environment" = "${var.Environment}"
    "Purpose"     = "splunk"
    "systemOwner" = "g53735"
    "project"     = "Cloud-POC"
  }

  metadata = {
    "__system__encrypted" = 1
    "__system__cmkid"     = "${var.key_id}"
  }
}

#Create the os volume
resource "opentelekomcloud_blockstorage_volume_v2" "splunkOSvolume" {
  count             = "${var.splunk_server_count}"
  name              = "${var.name_prefix}_SOsDisk${format("%02d", count.index+1)}"
  size              = "30"
  image_id          = "${var.image_id}"
  availability_zone = "${var.Availability_zone}"

  tags = {
    "appCode"     = "splunk"
    "costCenter"  = "${var.Cost_Centre}"
    "environment" = "${var.Environment}"
    "Purpose"     = "splunk"
    "systemOwner" = "g53735"
    "project"     = "Cloud-POC"
  }
}

