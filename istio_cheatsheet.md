# Istio

## How to Install Istioctl
```bash
curl -sL https://istio.io/downloadIstioctl | sh -

export PATH=$HOME/.istioctl/bin:$PATH

```

## How to check list of profiles for Installation

```bash
istioctl profile list

```

## How to check Install with a selected profile
```bash
istioctl manifest apply --set profile=demo

```
## Install Kiali
```bash
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.17/samples/addons/kiali.yaml

```
## Install Grafana
```bash
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.17/samples/addons/grafana.yaml


```
## Install Prometheus
```bash
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.17/samples/addons/prometheus.yaml

```
## Port Forward command
```bash
kubectl --namespace istio-system port-forward <podname> port:port &

```

## After Installation Clone the below repo
```bash
https://github.com/NarendraGodi/kubernetes-communication.git

```

## cd to the repo and inject istio-side car manually.
```bash
istioctl kube-inject --filename kubernetes-communication/alpine.yaml

```

## apply the change to the to the pod
```bash
istioctl kube-inject --filename kubernetes-communication/alpine.yaml | kubectl apply --filename -

```

## If you have deployment in default ns and it is istio enabled and dont want istio anymore do the following
```bash
kubectl label ns default istio-injection-
kubectl rollout restart deploy <deployment-name>
```


