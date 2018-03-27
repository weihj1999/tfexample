variable "username" {
  # If you don't fill this in, you will be prompted for it
  default = "weihongjin"
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
  default = "eu-de"
}

variable "endpoint" {
  default = "https://iam.eu-de.otc.t-systems.com:443/v3"
}

variable "ssh_pub_key" {
  default = "~/.ssh/id_rsa.pub"
}

variable "nginx_port" {
  description = "The port the server will use for HTTP requests"
  default = 80
}

variable "listener_port" {
  description = "The port the server will use for loadbalancer"
  default = 80
}


variable "project" {
  default = "wordpress"
}

variable "num_server" {
  default = 2
}

variable "image_name" {
  default = "Standard_CentOS_7.3_latest"
}

variable "flavor_name" {
  default = "s2.large.2"
}

variable "subnet_cidr" {
  default = "192.168.21.0/24"
}
