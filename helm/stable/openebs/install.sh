#!/bin/sh

helm install stable/openebs --name openebs --namespace openebs -f values.yaml

kubectl patch sc openebs-cstor-sparse -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'
