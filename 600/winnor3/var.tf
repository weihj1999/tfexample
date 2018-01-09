variable "username" {
  # If you don't fill this in, you will be prompted for it
  default = "weihongjin"
  #default = "temp-weihongjin"
}

variable "password" {
  # If you don't fill this in, you will be prompted for it
  default = "Tsi8675**"
}

variable "domain_name" {
  # If you don't fill this in, you will be prompted for it
  default = "OTC00000000001000010501"
}

variable "tenant_name" {
  #default = "eu-de_Nordea"
}

variable "endpoint" {
  default = "https://iam.eu-de.otc.t-systems.com:443/v3"
}

variable "kms_vol_key" {
   #default = "3f1e82ae-4433-43fd-865a-12fe1c3fa4ad"
   #default = "fc9f2d4c-8104-4387-beba-427e38dd50cf"
}

variable "engine_count" {
   #default = 40
}

#variable "existing_subnet_id" {}

variable "availability_zone" {}
variable "flavor_name" {}
variable "image_id" {}
variable "zone_id" {}
variable "admin_pass" {}
variable "existing_private_net_id" {}

#variable "user-data" {
#  default = "user-data.cmd"
#}
