#!/bin/bash -e

kubectl config set-context --current --namespace=istio-demo >/dev/null

export SLEEP_POD=$(kubectl get pod -l app=sleep -o jsonpath={.items..metadata.name})
kubectl exec "${SLEEP_POD}" -c sleep -- curl -sS http://httpbin:8000/headers

kubectl config set-context --current --namespace=default >/dev/null
