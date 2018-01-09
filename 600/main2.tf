module "winnor2" {
  source = "./winnor2"
  tenant_name="eu-de_nordea2"
  engine_count = 100 
  flavor_name = "s2.large.2"
  admin_pass = "Passw0rd"
  #flavor_name = "c2.4xlarge"
  #Enterprise_Windows_STD_2012R2_KVM
  #image_id = "87f30472-3679-4e1f-8f45-afb96556a73e"
  #Enterprise_Windows_STD_2012R2_xen
  zone_id = "ff8080826099290f0160d8893e751065"
  image_id = "073feea8-fbb5-4ce6-ae39-ef827523791e"
  kms_vol_key = "6778bba6-7204-4e02-8a68-b29e898a999b"
  existing_private_net_id = "63acb2fc-0969-4815-ae8f-ea0229ec46cc"
  availability_zone ="eu-de-01"
}
