kubectl create ns app-team1

kubectl create ns internal

kubectl create deploy front-end --image=nginx

kubectl create deploy loadbalancer --image=nginx

cat <<EOF | kubectl apply -f -
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: csi-hostpath-sc
provisioner: kubernetes.io/gce-pd
parameters:
  type: pd-standard
EOF

cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Pod
metadata:
  name: foobar
spec:
  containers:
  - image: radial/busyboxplus:curl
    name: busybox
    command: ['sh', '-c', 'while true; do echo "unable-to-access-website"; sleep 10; done']
EOF

sudo mkdir -p /opt/KUTR00101/

cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Pod
metadata:
  name: legacy-app
spec:
  containers:
  - name: count
    image: busybox
    args:
    - /bin/sh
    - -c
    - >
      i=0;
      while true;
      do
        echo "$(date) INFO $i" >> /var/log/legacy-ap.log;
        i=$((i+1));
        sleep 1;
      done
    volumeMounts:
    - name: logs
      mountPath: /var/log
  volumes:
  - name: logs
    emptyDir: {}
EOF

kubectl run my-pod --image=nginx -l name=cpu-user
kubectl run my-pod1 --image=nginx -l name=cpu-user
kubectl run my-pod2 --image=nginx -l name=cpu-user

kubectl create deploy drain-deploy --image=nginx --replicas=8

kubectl taint node $(kubectl get nodes|awk 'NR == 3 {print $1}') cka=true:NoSchedule

kubectl label node $(kubectl get nodes|awk 'NR == 2 {print $1}') disk=spinning
