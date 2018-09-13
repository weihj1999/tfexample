resource "opentelekomcloud_dns_zone_v2" "weihj_test_com" {
  name = "weihj.test.com."
  email = "jdoe@example.com"
  description = "An example zone"
  ttl = 3000
  type = "public"
}

resource "opentelekomcloud_dns_zone_v2" "weihj-private_test_com" {
  name = "weihj.ptest.com."
  email = "jdoe@example.com"
  description = "An example zone"
  ttl = 3000
  type = "private"
  router = {
     router_id = "${var.vpc_id}"
     router_region = "${var.region}"
  }
}

