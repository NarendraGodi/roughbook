kubectl delete namespace/app-team1 namespace/internal deployment.apps/front-end deployment.apps/loadbalancer storageclass.storage.k8s.io/csi-hostpath-sc\
 pod/foobar pod/podname pod/my-pod pod/my-pod1 pod/my-pod2 deploy/drain-deploy

kubectl taint node $(kubectl get nodes|awk 'NR == 3 {print $1}') cka-
kubectl label node $(kubectl get nodes|awk 'NR == 2 {print $1}') disk-
kubectl delete clusterrole deployment-clusterrole
kubectl delete clusterrolebinding deployment-clusterrole-binding
kubectl delete namespace ing-internal
kubectl delete svc front-end-svc
