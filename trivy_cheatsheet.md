# Trivy

## Trivy Installation
```bash
sudo apt-get install wget apt-transport-https gnupg lsb-release
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | sudo apt-key add -
echo deb https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main | sudo tee -a /etc/apt/sources.list.d/trivy.list
sudo apt-get update
sudo apt-get install trivy

# if apt did not work then try snap

snap install trivy

```

## Scan the image using Trivy
```bash
y

```

## Provide exit code if there are vulnerabilities
```bash
# irresctive of the ciriticality
$ trivy image --exit-code 1 python:3.4-alpine3.9

# targeting medium to high ciriticality

$ trivy image --exit-code 0 --severity MEDIUM,HIGH ruby:2.4.0
$ trivy image --exit-code 1 --severity CRITICAL ruby:2.4.0

```
