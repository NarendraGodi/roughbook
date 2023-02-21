
helm repo add bitnami https://charts.bitnami.com/bitnami

helm repo list

helm repo update

helm repo remove https://charts.bitnami.com/bitnami

helm search repo mysql

helm search repo mysql --versions

helm install my-tom my-bitnami/mysql

helm ls

helm uninstall mysql-1 (Will completely delete the package including the history)

helm uninstall  mysql-1 --keep-history

helm status mysql-1

helm install mysql-1 my-bitnami/mysql
Error: INSTALLATION FAILED: cannot re-use a name that is still in use

helm install mysql-1 my-bitnami/mysql -n internal

helm ls -n internal

helm install mysql-1 my-bitnami/mysql -n internal --set auth.rootPassword=test1234

helm install mysql-1 my-bitnami/mysql -n helm --values values.yaml

helm repo update

helm upgrade mysql-1 my-bitnami/mysql -n helm --values values.yaml

kubectl get secrets -n helm (To get the helm upgrade history or release data)

helm upgrade mysql-1 my-bitnami/mysql -n helm --reuse-values (It will use previously set values through values.yaml)








