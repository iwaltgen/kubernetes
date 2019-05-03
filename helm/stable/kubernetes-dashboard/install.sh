#!/bin/sh

helm install stable/kubernetes-dashboard --name kubernetes-dashboard --namespace kube-system -f values.yaml

kubectl edit svc/kubernetes-dashboard -n kube-system
