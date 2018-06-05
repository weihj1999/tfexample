variable "OS_PASSWORD" {
  default = "Tsi8675*("
}

variable "OS_USERNAME" {
  default = "weihongjin"
}

variable "OS_DOMAIN" {
  default = "OTC00000000001000010501"
}

variable "Compute_type" {
  description = "splunk compute type"
  #default = "s2.8xlarge.2"
  default = "c2.large"
}

variable "Location" {
  description = "Geo location of machines"
  default = "eu-de"
}

variable "existing_subnet_id" {
  type  = "map"
  description = "The id for the existing subnet in the existing virtual network"
  default ={
    prod = "e3c83074-885b-4b2b-82e0-3acb94a8c26b"
  }
}

variable "existing_vpc_id" {
  type = "map"
  description = "The id of the existing VPC"
  default = {
    prod = "5146a3c4-0615-457e-8775-023ec771ef99"
  }
}

variable "Security_group_ID" {
  description = "The Access control groups assigned"
  type = "map"
  default = {
    prod = "d0a4d81d-b3cd-41d3-b39e-a3eaa0c12e8b"
  }
}

variable "DNSzone" {
  description = "The dns domain zone"
  default = "otc.nortst.com."
}

variable "image_id" {
  description = "The os image id to be used"
  default = "1f255ebb-aa94-4d5a-84f7-84b2f12c43d8"
}

variable "tenant_name" {
  default = "eu-de_ansible"
}

variable "tenant_id" {
  default = "91d687759aed45d28b5f6084bc2fa8ad"
}


variable "splunk_server_count" {
  description = "The number of splunk servers"
  default = 2
}

variable "name_prefix" {
  description = "The splunk prefix to make it unique"
}

variable "Environment" {
  description = "The Environment, Either prod, preprod, uat or test"
}

variable "Cost_Centre" {
  description = "The area that owns these splunk servers and will ultimatly pay the bill"
}

variable "disk_size_gb" {
  description = "The disk size for splunk servers"
  default  = "50"
}

variable "key_id" {
  description = "The id of the disk encryption key"
  default = "2401bf77-d01f-4de2-9015-5674a489fca8"
}
variable  "Availability_zone" {
  description  = "The location to create this machine"
  default = "eu-de-01"
}

