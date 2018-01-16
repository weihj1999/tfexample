# tfexample
Provide an example to show how to use Open Telekom Cloud to build your infrastructure. 

AZ is specified to eu-de-01




network Structure:

+gateway-net

+mgmt-net

	+mgmt service
+grid-net

	+grid cluster
+fe-net

	+jumphost
+data-net

	+Filer service


All the resources are create in the AZ "eu-de-01" of the region "eu-de"

There were not eip, vpn and autoscaling enabled in this example. 

The scripts folder is kept for the cloud-init for provisioning. 


Important Notice
1.  All instances should add dependency.
  depends_on = ["opentelekomcloud_networking_subnet_v2.grid-subnet","opentelekomcloud_blockstorage_volume_v2.grid-broker-sys-vol"]

2. The default egress direction is allow all once a security group rule is added. Security group rules
 for both ingress and egress are treated the same. The rules are additive, so as long as the traffic is
 allowed by any rule, it'll go through. As there is no deny rule list like all egress is allowed, and 
 if any rules were defined then only those rules would be enforced and there would be a default deny 
 for everything else

How to control concurrency in Terraform?

Add command line flag:
-parallelism=n - Limit the number of concurrent operation as Terraform

The amount of parallelism is limited using a semaphore to prevent too many concurrent operations from 
overwhelming the resources of the machine running Terraform. By default, up to 10 nodes in the graph 
will be processed concurrently. This number can be set using the -parallelism flag on the plan, apply,
 and destroy commands.

Setting -parallelism is considered an advanced operation and should not be necessary for normal usage 
of Terraform. It may be helpful in certain special use cases or to help debug Terraform issues.

How to define rds specification

datastore name:  PostgreSQL
datastore version: 9.5.5 , 9.6.5, 9.6.3
speccode:  prefixed by rds.pg., then support flavors: s1.xlarge, m1.2xlarge, s1.medium, c2.medium, s1.large, 
c2.large, m1.large, s1.2xlarge and m1.xlarge

datastore name:  MySQL
datastore version: 5.6.33, 5.6.30, 5.6.34, 5.6.35, 5.6.36, 5.7.17, 5.7.20
speccode:  prefixed by rds.mysql., then support flavors: s1.xlarge, m1.2xlarge, s1.medium, c2.medium, s1.large,
c2.large, m1.large, s1.2xlarge and m1.xlarge

datastore name:  SQLServer
datastore version: 2014 SP2 SE
speccode:  prefixed by rds.pg., then support flavors: s1.xlarge, m1.2xlarge, c2.xlarge, s1.2xlarge and m1.xlarge

