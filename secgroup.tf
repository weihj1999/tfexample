###############################################################
# Define security group rule for management service
# Please change the default rule accroding to you secure requirement
###############################################################
resource "opentelekomcloud_compute_secgroup_v2" "secgrp-mgmt" {
  name        = "secgrp-mgmt"
  description = "security group for management service"

  rule {
    from_port   = 22
    to_port     = 22
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }

  rule {
    from_port   = 80
    to_port     = 80
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }

  rule {
    from_port   = 3389
    to_port     = 3389
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }

  rule {
    from_port   = -1
    to_port     = -1
    ip_protocol = "icmp"
    cidr        = "0.0.0.0/0"
  }
}
###############################################################
# Define security group rule for front-end service
# Please change the default rule accroding to you secure requirement
###############################################################

resource "opentelekomcloud_compute_secgroup_v2" "secgrp-fe" {
  name        = "secgrp-fe"
  description = "security group for front-end service"

  rule {
    from_port   = 22
    to_port     = 22
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }

  rule {
    from_port   = 3389
    to_port     = 3389
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }

  rule {
    from_port   = 443 
    to_port     = 443
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }

  rule {
    from_port   = -1
    to_port     = -1
    ip_protocol = "icmp"
    cidr        = "0.0.0.0/0"
  }
}
###############################################################
# Define security group rule for grid cluster
# Please change the default rule accroding to you secure requirement
###############################################################

resource "opentelekomcloud_compute_secgroup_v2" "secgrp-grid" {
  name        = "secgrp-grid"
  description = "security group for grid host"

  rule {
    from_port   = 22
    to_port     = 22
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }

  rule {
    from_port   = 80
    to_port     = 80
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }

  rule {
    from_port   = -1
    to_port     = -1
    ip_protocol = "icmp"
    cidr        = "0.0.0.0/0"
  }
}

###############################################################
# Define security group rule for Filer service
# Please change the default rule accroding to you secure requirement
###############################################################
resource "opentelekomcloud_compute_secgroup_v2" "secgrp-data" {
  name        = "secgrp-data"
  description = "security group for Filer service"

  rule {
    from_port   = 22
    to_port     = 22
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }

  rule {
    from_port   = 111
    to_port     = 111
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }

  rule {
    from_port   = 2049
    to_port     = 2049
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }

  rule {
    from_port   = -1
    to_port     = -1
    ip_protocol = "icmp"
    cidr        = "0.0.0.0/0"
  }
}

