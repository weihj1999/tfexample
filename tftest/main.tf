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
  engine_count = 100
  flavor_name = "s2.large.2"
  kms_vol_key = "3e71f3f9-c361-49b2-b3a1-cdae626c2211"
  existing_subnet_id = "28eb42a0-09d7-4612-9314-b8116c215a82"
  availability_zone ="eu-de-01"
}

module "test2" {
  source = "./test2"
  tenant_name="eu-de_nordea2"
  engine_count = 100
  flavor_name = "s2.large.2"
  kms_vol_key = "6778bba6-7204-4e02-8a68-b29e898a999b"
  existing_subnet_id = "63acb2fc-0969-4815-ae8f-ea0229ec46cc"
  availability_zone ="eu-de-02"
}

module "test3" {
  source = "./test3"
  tenant_name="eu-de_nordea3"
  engine_count = 100
  flavor_name = "s2.large.2"
  kms_vol_key = "66a73710-7fa6-4d4c-b90c-2eb61e97ca08"
  existing_subnet_id = "d5115e6e-4234-49d0-b930-1c5eb92e9b91"
  availability_zone ="eu-de-01"
}

module "test4" {
  source = "./test4"
  tenant_name="eu-de_nordea4"
  engine_count = 100
  flavor_name = "s2.large.2"
  kms_vol_key = "794fda9f-d840-4290-8e8f-83e7b03f479c"
  existing_subnet_id = "9c844f1b-19b3-4242-a6ea-de88469fa66d"
  availability_zone ="eu-de-02"
}

module "test5" {
  source = "./test5"
  tenant_name="eu-de_nordea5"
  engine_count = 100
  flavor_name = "c2.large"
  kms_vol_key = "48e7db2e-8c7e-4add-abcf-accae04b670e"
  existing_subnet_id = "b88cd576-9565-40f0-8f62-400ae8cbe06c"
  availability_zone ="eu-de-01"
}

module "test6" {
  source = "./test6"
  tenant_name="eu-de_nordea6"
  engine_count = 100
  flavor_name = "c2.large"
  kms_vol_key = "a823bcea-a1fc-4fc1-9e6d-254b62a68ff2"
  existing_subnet_id = "f5a0a48c-5a5f-4f35-9bb0-20f3a1483c5d"
  availability_zone ="eu-de-02"
}

module "test7" {
  source = "./test7"
  tenant_name="eu-de_nordea7"
  engine_count = 100
  flavor_name = "c2.large"
  kms_vol_key = "15afd3a4-2169-4ff2-925a-11cdefdfd938"
  existing_subnet_id = "470ef214-acbe-4134-9fbf-1b20f4b8f28d"
  availability_zone ="eu-de-01"
}

module "test8" {
  source = "./test8"
  tenant_name="eu-de_mahb"
  engine_count = 90
  flavor_name = "s2.large.2"
  kms_vol_key = "2401bf77-d01f-4de2-9015-5674a489fca8"
  existing_subnet_id = "d07a5abe-56ff-4ef4-96c9-9edca9317f56"
  availability_zone ="eu-de-02"
}

module "test9" {
  source = "./test9"
  tenant_name="eu-de_sunway"
  engine_count = 100
  flavor_name = "s2.large.2"
  kms_vol_key = "709b3a63-47ef-4403-afe9-2998aa2775cd"
  existing_subnet_id = "8bbd1357-53ad-4006-a77a-da8b3694ae70"
  availability_zone ="eu-de-01"
}

module "test10" {
  source = "./test10"
  tenant_name="eu-de_Nordea"
  engine_count = 90
  flavor_name = "s2.large.2"
  kms_vol_key = "fc9f2d4c-8104-4387-beba-427e38dd50cf"
  existing_subnet_id = "b210a144-5a43-4b3c-86ac-411b709dd8e3"
  availability_zone ="eu-de-02"
}

