
# kubernetes setup

[k8s 설치](https://jwcheong0420.github.io/2018/08/09/how-to-install-k8s/)

## kubernetes init

```sh
# swap on (optional)
sed -i '9s/^/Environment="KUBELET_EXTRA_ARGS=--fail-swap-on=false"\n/' /etc/systemd/system/kubelet.service.d/10-kubeadm.conf
systemctl daemon-reload
systemctl restart kubelet

sudo kubeadm init --pod-network-cidr=192.168.0.0/16 --ignore-preflight-errors Swap | sudo tee kubeadm_init_output

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

kubectl apply -f https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/rbac-kdd.yaml
kubectl apply -f https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/kubernetes-datastore/calico-networking/1.7/calico.yaml
```

## kubernetes single node (optional)

```sh
kubectl taint nodes --all node-role.kubernetes.io/master-
```

## kubernetes create RABC defaults

```sh
kubectl apply -f rabc/defaults/cluster_reader.yaml
```

## kubernetes reset

```sh
sudo kubeadm reset
```
