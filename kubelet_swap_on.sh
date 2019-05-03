#!/bin/sh

sed -i '9s/^/Environment="KUBELET_EXTRA_ARGS=--fail-swap-on=false"\n/' /etc/systemd/system/kubelet.service.d/10-kubeadm.conf
systemctl daemon-reload
systemctl restart kubelet
