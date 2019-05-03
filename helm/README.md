# kubernetes helm

[helm 설치](https://helm.sh/docs/using_helm/)

## setup

```sh
kubectl create -f rbac-config.yaml
helm init --service-account tiller --history-max 200
```

## uninstall

```sh
helm reset --force
```
