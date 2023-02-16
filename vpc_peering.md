
# Create VPCs (vpc-1,vpc-2)

gcloud compute networks create vpc-1 --subnet-mode=custom

gcloud compute networks subnets create subnet-a --network=vpc-1 --range=10.0.1.0/24 --region=us-central1
gcloud compute networks subnets create subnet-b --network=vpc-1 --range=10.0.2.0/24 --region=us-central1

gcloud compute networks create vpc-2 --subnet-mode=custom

gcloud compute networks subnets create subnet-c --network=vpc-2 --range=10.0.3.0/24 --region=us-west1
gcloud compute networks subnets create subnet-d --network=vpc-2 --range=10.0.4.0/24 --region=us-west1


# Create 4 VMs () each representing a zone in the subnet with network tags.

gcloud compute instances create instance-vpc1-a --zone=us-central1-a --machine-type=f1-micro --subnet=subnet-a --tags=vpc1-a --no-address
gcloud compute instances create instance-vpc1-b --zone=us-central1-b --machine-type=f1-micro --subnet=subnet-a --tags=vpc1-b --no-address
gcloud compute instances create instance-vpc2-a --zone=us-west1-a --machine-type=f1-micro --subnet=subnet-c --tags=vpc2-a --no-address
gcloud compute instances create instance-vpc2-b --zone=us-west1-b --machine-type=f1-micro --subnet=subnet-d --tags=vpc2-b --no-address

# Create a Firewall Rule so that VMs within their respective VPCs can communicate with each other.

gcloud compute --project=network-70588 firewall-rules create within-vpc1 --direction=INGRESS --priority=1000 --network=vpc-1 --action=ALLOW --rules=tcp:22,icmp --source-ranges=0.0.0.0/0

gcloud compute --project=network-70588 firewall-rules create within-vpc2 --direction=INGRESS --priority=1000 --network=vpc-2 --action=ALLOW --rules=tcp:22,icmp --source-ranges=0.0.0.0/0

# Create a VPC Peering
# Check if VMs in vpc-1 are able to communicate with the VMs in vpc-2 and vice-versa

# Delete the Previously created firewall rules.

gcloud compute --project=network-70588 firewall-rules delete within-vpc1
gcloud compute --project=network-70588 firewall-rules delete within-vpc2

# Create a New fire wall rule so that the VMs can communicate with each other within the VPC peering based on network tags.

gcloud compute --project=network-70588 firewall-rules create ping-with-tags-vpc1 --direction=INGRESS --priority=1000 --network=vpc-1 --action=ALLOW --rules=tcp:22,icmp --source-ranges=0.0.0.0/0 --target-tags=vpc1-a,vpc1-b,vpc2-a,vpc2-b

gcloud compute --project=network-70588 firewall-rules create ping-with-tags-vpc2 --direction=INGRESS --priority=1000 --network=vpc-1 --action=ALLOW --rules=tcp:22,icmp --source-ranges=0.0.0.0/0 --target-tags=vpc1-a,vpc1-b,vpc2-a,vpc2-b

# Delete the VPC Peering

# Delete the FireWalls

gcloud compute --project=network-70588 firewall-rules delete ping-with-tags-vpc1
gcloud compute --project=network-70588 firewall-rules delete ping-with-tags-vpc2

# Delete the VMs

gcloud compute instances delete instance-vpc1-a --zone=us-central1-a
gcloud compute instances delete instance-vpc1-b --zone=us-central1-b
gcloud compute instances delete instance-vpc2-a --zone=us-west1-a
gcloud compute instances delete instance-vpc2-b --zone=us-west1-b

# Delete Subnets

gcloud compute networks subnets delete subnet-a --region=us-central1
gcloud compute networks subnets delete subnet-b --region=us-central1
gcloud compute networks subnets delete subnet-c --region=us-west1
gcloud compute networks subnets delete subnet-d --region=us-west1

# Delete the VPCs

gcloud compute networks delete vpc-1 --project=network-70588
gcloud compute networks delete vpc-2 --project=network-70588




