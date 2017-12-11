#provider "opentelekomcloud" {
#  user_name   = "${var.username}"
#  password    = "${var.password}"
#  tenant_name = "${var.tenant_name}"
#  domain_name = "${var.domain_name}"
#  auth_url    = "${var.endpoint}"
#}
module "test1" {
  source = "./test1"
  tenant_name="eu-de_nordea1"
  engine_count = 50
  flavor_name = "s2.xlarge.4"
  kms_vol_key = "3e71f3f9-c361-49b2-b3a1-cdae626c2211"
  existing_subnet_id = "28eb42a0-09d7-4612-9314-b8116c215a82"
  availability_zone ="eu-de-01"
}

module "test2" {
  source = "./test2"
  tenant_name="eu-de_nordea2"
  engine_count = 50
  flavor_name = "s2.xlarge.4"
  kms_vol_key = "6778bba6-7204-4e02-8a68-b29e898a999b"
  existing_subnet_id = "63acb2fc-0969-4815-ae8f-ea0229ec46cc"
  availability_zone ="eu-de-02"
}

module "test3" {
  source = "./test3"
  tenant_name="eu-de_nordea3"
  engine_count = 50
  flavor_name = "s2.xlarge.4"
  kms_vol_key = "66a73710-7fa6-4d4c-b90c-2eb61e97ca08"
  existing_subnet_id = "d5115e6e-4234-49d0-b930-1c5eb92e9b91"
  availability_zone ="eu-de-01"
}

module "test4" {
  source = "./test4"
  tenant_name="eu-de_nordea4"
  engine_count = 50
  flavor_name = "s2.xlarge.4"
  kms_vol_key = "794fda9f-d840-4290-8e8f-83e7b03f479c"
  existing_subnet_id = "9c844f1b-19b3-4242-a6ea-de88469fa66d"
  availability_zone ="eu-de-02"
}

