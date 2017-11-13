##########################################################3
#
#
resource "opentelekomcloud_compute_keypair_v2" "grid-terraform-key" {
  name       = "grid-terraform-key"
  public_key = "${file("${var.ssh_pub_key}")}"
}
