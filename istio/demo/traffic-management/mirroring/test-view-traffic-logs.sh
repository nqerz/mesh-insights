#!/bin/bash -e

kubectl config set-context --current --namespace=istio-demo > /dev/null

printf "print v1 logs:\n"
# View pod logs
export V1_POD=$(kubectl get pod -l app=httpbin,version=v1 -o jsonpath={.items..metadata.name})
kubectl logs "$V1_POD" -c httpbin

printf "\nprint v2 logs:\n"

export V2_POD=$(kubectl get pod -l app=httpbin,version=v2 -o jsonpath={.items..metadata.name})
kubectl logs "$V2_POD" -c httpbin

kubectl config set-context --current --namespace=default  > /dev/null
