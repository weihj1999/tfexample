### OpenTelekomCloud Credentials
variable "username" {
  # If you don't fill this in, you will be prompted for it
  default = "<otc-user>"
}

variable "password" {
  # If you don't fill this in, you will be prompted for it
  default = "<user-password>"
}

variable "domain_name" {
  # If you don't fill this in, you will be prompted for it
  default = "<domain-id>"
}

variable "tenant_name" {
  default = "eu-de"
}

variable "endpoint" {
  default = "https://iam.eu-de.otc.t-systems.com:443/v3"
}

variable "ssh_pub_key" {
  default = "~/.ssh/id_rsa.pub"
}

variable "broker_count" {
  default = 2
}

variable "director_count" {
  default = 2
}

variable "engine_count" {
  default = 2
}

variable "splunk_count" {
  default = 2
}

variable "jumphost_count" {
  default = 2
}

variable "filer_count" {
  default = 2
}


