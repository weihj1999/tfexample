module "prod01" {
  source = "./prod01"
  tenant_name="eu-de"
  engine_count = 10
  flavor_name = "s2.xlarge.4"
  image_id = "4897a7a2-b184-42ba-bd0a-20aa3c219bf9"
  #zone_id = "ff8080826099290f0160e23f731f131e"
  kms_vol_key = "a0218217-4ec6-44fc-8d2f-ef7c5b1036e6"
  existing_private_net_id = "898db3a7-5aa0-42ed-8186-0888b6195cdc"
  availability_zone ="eu-de-01"
}
module "prod02" {
  source = "./prod02"
  tenant_name="eu-de"
  engine_count = 10
  flavor_name = "s2.xlarge.4"
  image_id = "4897a7a2-b184-42ba-bd0a-20aa3c219bf9"
  #Enterprise_Windows_STD_2012R2_KVM
  #zone_id = "ff8080826099290f0160e23f731f131e"
  kms_vol_key = "a0218217-4ec6-44fc-8d2f-ef7c5b1036e6"
  existing_private_net_id = "898db3a7-5aa0-42ed-8186-0888b6195cdc"
  availability_zone ="eu-de-02"
}
