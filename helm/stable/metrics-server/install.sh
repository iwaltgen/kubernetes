#!/bin/sh

helm install stable/metrics-server --name metrics-server --namespace kube-system -f values.yaml
