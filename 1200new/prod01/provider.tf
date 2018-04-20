provider "opentelekomcloud" {
  user_name   = "${var.username}"
  password    = "${var.password}"
  tenant_name = "${var.tenant_name}"
  domain_name = "${var.domain_name}"
  auth_url    = "${var.endpoint}"
}

# Configure the Bind9 DNS Provider
#provider "dns" {
#  update {
#    server        = "vpn-nodelete.otc.nortst.com"
#    key_name      = "dhcpupdate."
#    key_algorithm = "hmac-md5"
#    key_secret    = "VDvU/QqN/l+nR0bWgyVm4Q=="
#  }
#}

# Configure the Window 2012 DNS Provider
provider "dns" {
  update {
    server        = "dns-nodelete.otc.nortst.com"
  }
}

