#!/bin/bash -v
#post for token
token=$(curl -0 -iv -X POST -v -H "content-type=application/json" https://iam.eu-de.otc.t-systems.com:443/v3/auth/tokens -d @auth.json 2>&1 | grep -m 1 -oP '(?<=X-Subject-Token:\s).*')

#echo $token

curl -iv -X POST -H "Content-Type: application/json" -H "Accept: application/json" -H "X-Auth-Token: $token" -d "@evs_replication.json" https://evs.eu-de.otc.t-systems.com/v2/91d687759aed45d28b5f6084bc2fa8ad/os-vendor-replications

#set th


