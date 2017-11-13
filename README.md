# tfexample
Provide an example to show how to use Open Telekom Cloud to build your infrastructure.


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
