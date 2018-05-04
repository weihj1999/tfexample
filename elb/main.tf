module "tomcat" {
  source = "./tomcat"
  tenant_name="eu-de_ansible"
  count = 2
  flavor_name = "c2.large"
  image_id = "ac0645c5-43be-488f-9ac8-b7fd5c372d24"
  existing_private_net_id = "e3c83074-885b-4b2b-82e0-3acb94a8c26b"
  availability_zone ="eu-de-01"
  existing_subnet_id = "837a8a8b-6ac8-4612-99b3-00f59eb1303b"
  security_group_id = "d0a4d81d-b3cd-41d3-b39e-a3eaa0c12e8b"
  vpc_id = "5146a3c4-0615-457e-8775-023ec771ef99"
}
