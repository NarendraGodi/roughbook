Configuring a User to connect Kubernetes Cluster:

1. Provision a Linux System and create a user.
2. Install kubectl


Installing Kubectl:
Generating a private key ⇒ openssl genrsa -out vamsi.key
```bash
$ openssl genrsa -out vamsi.key
Generating RSA private key, 2048 bit long modulus (2 primes)
..........................................................................+++++
```
Create a Certificate Signin Request(CSR) ==> openssl req -new -key vamsi.key -out vamsi.csr -subj "/CN=vamsi/O=development"
Above command will generate a csr file.
```bash

```

Generate a Self signed Certificate for that we need Certificate Authority keys for the kubernetes Cluster (ca.crt, ca.key)
The ca.crt and  ca.key files can be copied from Master (/etc/kubernetes/pki)node to the jump server which we have created.

```bash
~$ openssl x509 -req -in vamsi.csr \
> -CA ca.crt  -CAkey ca.key -CAcreateserial -out vamsi.crt -days 45
Signature ok
subject=CN = vamsi, O = development
Getting CA Private Key
~$ ls -la
total 48
-rw-r--r-- 1 vamsi vamsi 1066 Sep  7 11:22 ca.crt
-rw------- 1 vamsi vamsi 1675 Sep  7 11:22 ca.key
-rw-r--r-- 1 vamsi vamsi   41 Sep  7 11:27 ca.srl
-rw-r--r-- 1 vamsi vamsi 1017 Sep  7 11:27 vamsi.crt
-rw-r--r-- 1 vamsi vamsi  915 Sep  7 11:12 vamsi.csr
-rw------- 1 vamsi vamsi 1675 Sep  7 11:08 vamsi.key

```

A Self signed Certificate will be created with the combination  of user.csr, ca.crt, ca.key

 

