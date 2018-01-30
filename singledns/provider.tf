
# Configure the DNS Provider
#provider "dns" {
#  update {
#    server        = "dns-nodelete.otc.nortst.com"
#    key_name      = "dhcpupdate."
#    key_algorithm = "hmac-md5"
#    key_secret    = "VDvU/QqN/l+nR0bWgyVm4Q=="
#  }
#}

provider "dns" {
  update {
    server        = "dns-nodelete.otc.nortst.com"
    #key_name      = "otc.nortst.com."
    #key_algorithm = "hmac-sha256"
    #key_secret    = "c665972126bff79105d80728e3c3294f92eb56f5047ccc7cc74770108155471d"
    #key_secret    = "d59cb6c6d5e635d4bac617d94b0d18a78846f18d2eb63143cb92eb52295c3b3e"
  }
}

