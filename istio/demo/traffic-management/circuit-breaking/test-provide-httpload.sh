#!/bin/bash -e

kubectl config set-context --current --namespace=istio-demo >/dev/null

export FORTIO_POD=$(kubectl get pods -l app=fortio -o 'jsonpath={.items[0].metadata.name}')
kubectl exec "$FORTIO_POD" -c fortio -- /usr/bin/fortio curl -quiet http://httpbin:8000/get

kubectl config set-context --current --namespace=default >/dev/null
