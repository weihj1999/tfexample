module "winnor4" {
  source = "./winnor4"
  tenant_name="eu-de_nordea4"
  engine_count = 100
  flavor_name = "s2.large.2"
  admin_pass = "Passw0rd"
  #flavor_name = "c2.4xlarge"
  #Enterprise_Windows_STD_2012R2_KVM
  #image_id = "87f30472-3679-4e1f-8f45-afb96556a73e"
  #Enterprise_Windows_STD_2012R2_xen
  zone_id = "ff8080826099290f0160d88b87301072"
  image_id = "073feea8-fbb5-4ce6-ae39-ef827523791e"
  kms_vol_key = "794fda9f-d840-4290-8e8f-83e7b03f479c"
  existing_private_net_id = "9c844f1b-19b3-4242-a6ea-de88469fa66d"
  availability_zone ="eu-de-01"
}
