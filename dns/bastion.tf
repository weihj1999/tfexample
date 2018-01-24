module "bas01" {
  source = "./bas01"
  tenant_name="eu-de"
  bastion_count = 120
  flavor_name = "s2.medium.4"
  image_id = "75d68bff-a1f2-497c-84d8-d5d16b2e7638"
#  zone_id = "ff8080826099290f0160e23f731f131e"
  kms_vol_key = "a0218217-4ec6-44fc-8d2f-ef7c5b1036e6"
  existing_private_net_id = "898db3a7-5aa0-42ed-8186-0888b6195cdc"
  availability_zone ="eu-de-01"
}

module "bas02" {
  source = "./bas02"
  tenant_name="eu-de"
  bastion_count = 120
  flavor_name = "s2.medium.4"
  image_id = "75d68bff-a1f2-497c-84d8-d5d16b2e7638"
#  zone_id = "ff8080826099290f0160e23f731f131e"
  kms_vol_key = "a0218217-4ec6-44fc-8d2f-ef7c5b1036e6"
  existing_private_net_id = "898db3a7-5aa0-42ed-8186-0888b6195cdc"
  availability_zone ="eu-de-02"
}


