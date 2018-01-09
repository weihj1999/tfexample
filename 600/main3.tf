module "winnor3" {
  source = "./winnor3"
  tenant_name="eu-de_nordea3"
  engine_count = 100
  flavor_name = "s2.large.2"
  admin_pass = "Passw0rd"
  #flavor_name = "c2.4xlarge"
  #Enterprise_Windows_STD_2012R2_KVM
  #image_id = "87f30472-3679-4e1f-8f45-afb96556a73e"
  #Enterprise_Windows_STD_2012R2_xen
  zone_id = "ff8080826099290f0160d88a658f106b"
  image_id = "073feea8-fbb5-4ce6-ae39-ef827523791e"
  kms_vol_key = "147ed29f-52a3-43ae-90f8-7433f0b87640"
  existing_private_net_id = "d5115e6e-4234-49d0-b930-1c5eb92e9b91"
  availability_zone ="eu-de-02"
}
