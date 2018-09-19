#!/bin/bash 
if [ "$#" -ne 1 ]; then 
    echo "illegal number of parameters"
    echo "Usage: ./$0 <monitor-id>"
    exit 1
fi
#post for token
token=$(curl -0 -iv -X POST -v -H "content-type=application/json" https://iam.eu-de.otc.t-systems.com:443/v3/auth/tokens -d @auth.json 2>&1 | grep -m 1 -oP '(?<=X-Subject-Token:\s).*')

#echo $token

curl -iv -X PUT -H "Content-Type: application/json" -H "Accept: application/json" -H "X-Auth-Token: $token" -d "@healthcheck.json" https://vpc.eu-de.otc.t-systems.com/v2.0/lbaas/healthmonitors/$1

#set th


