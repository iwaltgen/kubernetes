#!/bin/sh

helm install stable/openebs --name openebs --namespace openebs -f values.yaml
