#### Create a firewall rule 

gcloud compute --project=networkp-72575 firewall-rules create vpc1-allow-icmp --direction=INGRESS --priority=1000 --network=vpc-1 --action=ALLOW --rules=tcp:22 --source-ranges=10.2.1.0/24,10.3.1.0/24


#### Create an Image
gcloud compute images create nfs-server-image --project=pg-63271 --source-disk=nfs-server --source-disk-zone=us-central1-a --storage-location=us-central1

#### Depricate an Image
gcloud compute images deprecate nfs-server-image --state=DEPRECATED 

#### Depricate an Image
gcloud compute images deprecate nfs-server-image --state=ACTIVE
