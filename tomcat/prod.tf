module "prod" {
  source = "./prod"
  tenant_name="eu-de_ansible"
  count = 1
  flavor_name = "c2.large"
  image_id = "ac0645c5-43be-488f-9ac8-b7fd5c372d24"
  existing_private_net_id = "e3c83074-885b-4b2b-82e0-3acb94a8c26b"
  availability_zone ="eu-de-01"
}
