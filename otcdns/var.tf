variable "username" {
  # If you don't fill this in, you will be prompted for it
  default = "<yourname>"
}

variable "password" {
  # If you don't fill this in, you will be prompted for it
  default = "<yourpassword>"
}

variable "domain_name" {
  # If you don't fill this in, you will be prompted for it
  default = "<yourdomain>"
}

variable "tenant_name" {
  default = "eu-de"
}

variable "region" {
  default = "eu-de"
}

variable "endpoint" {
  default = "https://iam.eu-de.otc.t-systems.com:443/v3"
}

variable "vpc_id" {
  default = "<yourvpc_id>"
}

