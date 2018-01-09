module "winnor5" {
  source = "./winnor5"
  tenant_name="eu-de_nordea5"
  engine_count = 100
  flavor_name = "s2.large.2"
  admin_pass = "Passw0rd"
  #flavor_name = "c2.4xlarge"
  #Enterprise_Windows_STD_2012R2_KVM
  #image_id = "87f30472-3679-4e1f-8f45-afb96556a73e"
  #Enterprise_Windows_STD_2012R2_xen
  zone_id = "ff8080826099290f0160d88d028f1079"
  image_id = "073feea8-fbb5-4ce6-ae39-ef827523791e"
  kms_vol_key = "9ecc1451-11a7-4734-a8fe-af1895e18488"
  existing_private_net_id = "b88cd576-9565-40f0-8f62-400ae8cbe06c"
  availability_zone ="eu-de-02"
}
