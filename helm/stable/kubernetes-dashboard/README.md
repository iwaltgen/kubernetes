# kubernetes dashboard

[Chart](https://github.com/helm/charts/tree/master/stable/kubernetes-dashboard)

## setup

```sh
helm install stable/kubernetes-dashboard --name kubernetes-dashboard --namespace kube-system -f values.yaml

kubectl edit svc/kubernetes-dashboard -n kube-system

# NodePort 사용시 아래 내용 수정 필요
# spec:
#   ports:
#     nodePort: 30443   [필드 추가]
#   type: NodePort     [ClusterIP 대체]
```

## token 조회

```sh
kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep kubernetes-dashboard-admin-token | awk '{print $1}')
```
