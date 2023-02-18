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

## apply the change to the to the pod
```bash
istioctl kube-inject --filename kubernetes-communication/alpine.yaml | kubectl apply --filename -

```


