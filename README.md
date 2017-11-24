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
