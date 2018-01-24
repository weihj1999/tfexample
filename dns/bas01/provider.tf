provider "opentelekomcloud" {
  user_name   = "${var.username}"
  password    = "${var.password}"
  tenant_name = "${var.tenant_name}"
  domain_name = "${var.domain_name}"
  auth_url    = "${var.endpoint}"
}

# Configure the DNS Provider
provider "dns" {
  update {
    server        = "vpn-nodelete.otc.nortst.com"
    key_name      = "dhcpupdate."
    key_algorithm = "hmac-md5"
    key_secret    = "VDvU/QqN/l+nR0bWgyVm4Q=="
  }
}

