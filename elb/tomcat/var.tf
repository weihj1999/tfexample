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
  default = "<changeme"
}


variable "endpoint" {
  default = "https://iam.eu-de.otc.t-systems.com:443/v3"
}

variable "count" {}
variable "tenant_name" {}
variable "existing_subnet_id" {}
variable "availability_zone" {}
variable "flavor_name" {}
variable "image_id" {}
variable "existing_private_net_id" {}
variable "security_group_id" {}
variable "vpc_id" {}
