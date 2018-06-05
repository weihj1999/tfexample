module "Splunk" {
  source            = "./SplunkLoadBalancer"
  Environment       = "prod"
  Availability_zone = "eu-de-02"
  Cost_Centre       = "SPLUNK"
  name_prefix = "splunk"
}

