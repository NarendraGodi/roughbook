
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

helm upgrade mysql-1 my-bitnami/mysql -n helm --values values.yaml (will update the pods that only have changes)

kubectl get secrets -n helm (To get the helm upgrade history or release data)

helm upgrade mysql-1 my-bitnami/mysql -n helm --reuse-values (It will use previously set values through values.yaml)

helm install my-tom my-bitnami/mysql --dry-run

helm template  my-bitnami/mysql -n helm --values values.yaml

helm get manifest  mysql-1 --revision 1

 helm get values mysql-2 --all (to get all the values for a particular release )

helm history mysql-1 -n helm

helm rollback mysql-1 1

helm install mysql-1 my-bitnami/mysql --namespace helm --create-namespace

helm upgrade --install my-apache my-bitnami/apache -n helm1 --create-namespace (CI/CD)

helm install my-bitnami/apache --generate-name -n helm1

helm install my-bitnami/apache --generate-name -n helm1 --name-template "mynewserver-{{randAlpha 7| lower}}"

helm install my-bitnami/apache --generate-name -n helm1 --name-template "mynewserver-{{randAlpha 7| upper}}" (It will not work due to kubernetes naming conventions)

helm install mysql-2 my-bitnami/mysql --wait (default is 5 minutes)

helm install mysql-2 my-bitnami/mysql --wait --timeout 1m

helm install mysql-2 my-bitnami/mysql --atomic(it will rollback to the previous version if the current version failed with default time limit is 5 minutes)

helm install mysql-2 my-bitnami/mysql --atomic --timeout 7m

helm upgrade mysql-1 my-bitnami/mysql -n helm --values values.yaml --force (Will delete the current deployment and recreate the deployment and not suitable for CI/CD)

helm upgrade mysql-1 my-bitnami/mysql -n helm --values values.yaml --cleanup-on-failure

helm create mychart

helm install firstapp mychart

helm lint (will validate all the files for syntactical errors and gives us errors if any in all the files)


** helm template will give the output but does not validate "--dry-run" will validate.







