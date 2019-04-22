#!/bin/sh

kubectl apply -f kubernetes-dashboard.yaml
kubectl apply -f kubernetes-dashboard-admin.yaml

kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep admin-user | awk '{print $1}')

