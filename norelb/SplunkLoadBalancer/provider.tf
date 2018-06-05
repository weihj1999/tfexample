provider "opentelekomcloud" {
  user_name   = "${var.OS_USERNAME}"
  password    = "${var.OS_PASSWORD}"
  tenant_name = "${var.tenant_name}"
  domain_name = "${var.OS_DOMAIN}"
  auth_url    = "https://iam.eu-de.otc.t-systems.com:443/v3"
}

provider "dns" {
  update {
    server = "dns-nodelete.otc.nortst.com"
  }
}

