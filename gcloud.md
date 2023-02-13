#### Create a firewall rule 

gcloud compute --project=networkp-72575 firewall-rules create vpc1-allow-icmp --direction=INGRESS --priority=1000 --network=vpc-1 --action=ALLOW --rules=tcp:22 --source-ranges=10.2.1.0/24,10.3.1.0/24
