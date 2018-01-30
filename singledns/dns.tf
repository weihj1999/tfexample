resource "dns_a_record_set" "www" {
  count = 3
  zone = "otc.nortst.com."
  name = "${element(var.testecs, count.index)}"
  addresses = ["${element(var.ipaddr,count.index)}"]
  ttl = 300
}
