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

variable "tenant_name" { }

variable "endpoint" {
  default = "https://iam.eu-de.otc.t-systems.com:443/v3"
}

variable "region" {}
variable "db_flavor" {}
variable "db_name" {}
variable "db_type" {}
variable "db_version" {}
variable "vpc_id" {}
variable "zone_id" {}
variable "existing_private_net_id" {}
variable "db_passwd" { }
variable "db_port" {}
variable "availability_zone" {}
variable "secgroup_name" {}

