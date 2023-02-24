## CI/CD with Jenkins, Gcloud and GKE

Jenkins Installation

```bash
# Installation of Java
 sudo apt update
 sudo apt install openjdk-11-jre
 java -version
 
# Installation of Jenkins

curl -fsSL https://pkg.jenkins.io/debian/jenkins.io.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
  
sudo apt-get update

sudo apt-get install jenkins

# Confirm "Y" whenever prompted
```
## Installation of gcloud CLI
```bash
sudo apt-get install apt-transport-https ca-certificates gnupg

echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main"  | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -

sudo apt-get update && sudo apt-get install google-cloud-cli

# Confirm "Y" whenever prompted
```
## For Jenkins to use Service account to connect to GCP Install 
```bash
# Important changes to Kubectl authentication are coming in GKE v1.26

sudo apt-get install google-cloud-sdk-gke-gcloud-auth-plugin

gke-gcloud-auth-plugin --version
```
## After updating the Service account use the below script  to test your connectivity

```groovy
pipeline {
  agent any
  environment {
    CLOUDSDK_CORE_PROJECT='Your-Project-ID'
  }
  stages {
    stage('test') {
      steps {
        withCredentials([file(credentialsId: 'jenkins-gcloud', variable: 'GCLOUD_CREDS')]) {
          sh '''
            gcloud container clusters get-credentials jenkins --zone us-east1-b --project Your-Project-ID
            helm install my-tom bitnami/mysql
          '''
        }
      }
    }
  }
}

```



