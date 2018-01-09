module "winnor1" {
  source = "./winnor1"
  tenant_name="eu-de_nordea1"
  engine_count = 100
  flavor_name = "s2.large.2"
  admin_pass = "Passw0rd"
  #flavor_name = "c2.4xlarge"
  #Enterprise_Windows_STD_2012R2_KVM
  #image_id = "87f30472-3679-4e1f-8f45-afb96556a73e"
  #Enterprise_Windows_STD_2012R2_xen
  zone_id = "ff8080826099290f0160b729d49a07d7"
  image_id = "073feea8-fbb5-4ce6-ae39-ef827523791e"
  kms_vol_key = "3e71f3f9-c361-49b2-b3a1-cdae626c2211"
  existing_private_net_id = "28eb42a0-09d7-4612-9314-b8116c215a82"
  availability_zone ="eu-de-02"
}
