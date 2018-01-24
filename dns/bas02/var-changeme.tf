variable "username" {
  # If you don't fill this in, you will be prompted for it
  default = "<changeme>"
}

variable "password" {
  # If you don't fill this in, you will be prompted for it
  default = "<changeme>"
}

variable "domain_name" {
  # If you don't fill this in, you will be prompted for it
  default = "<changeme>"
}

variable "tenant_name" {
  #default = "eu-de_<changeme>"
}

variable "endpoint" {
  default = "https://iam.eu-de.otc.t-systems.com:443/v3"
}

variable "kms_vol_key" {
}

variable "engine_count" {
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
