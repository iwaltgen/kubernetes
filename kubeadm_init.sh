#!/bin/sh

sudo kubeadm init --pod-network-cidr=192.168.0.0/16 | sudo tee kubeadm_init_output

## kubernetes swap on mode ##
# sed -i '9s/^/Environment="KUBELET_EXTRA_ARGS=--fail-swap-on=false"\n/' /etc/systemd/system/kubelet.service.d/10-kubeadm.conf
# systemctl daemon-reload
# systemctl restart kubelet
# sudo kubeadm init --pod-network-cidr=192.168.0.0/16 --ignore-preflight-errors Swap | sudo tee kubeadm_init_output

mkdir -p $HOME/.kube
sudo cp -f /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

kubectl apply -f https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/rbac-kdd.yaml
kubectl apply -f https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/kubernetes-datastore/calico-networking/1.7/calico.yaml

## kubernetes single node mode ##
kubectl taint nodes --all node-role.kubernetes.io/master-

