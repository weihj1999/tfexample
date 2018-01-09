module "winnor6" {
  source = "./winnor6"
  tenant_name="eu-de_nordea6"
  engine_count = 100
  flavor_name = "s2.large.2"
  admin_pass = "Passw0rd"
  #flavor_name = "c2.4xlarge"
  #Enterprise_Windows_STD_2012R2_KVM
  #image_id = "87f30472-3679-4e1f-8f45-afb96556a73e"
  #Enterprise_Windows_STD_2012R2_xen
  zone_id = "ff8080826099290f0160d88dca041089"
  image_id = "073feea8-fbb5-4ce6-ae39-ef827523791e"
  kms_vol_key = "a823bcea-a1fc-4fc1-9e6d-254b62a68ff2"
  existing_private_net_id = "f5a0a48c-5a5f-4f35-9bb0-20f3a1483c5d"
  availability_zone ="eu-de-01"
}
