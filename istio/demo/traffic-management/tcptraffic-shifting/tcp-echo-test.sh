#!/bin/bash
kubectl config set-context --current --namespace=istio-demo  > /dev/null

INGRESS_HOST=$(kubectl get svc istio-ingressgateway -o jsonpath='{.spec.clusterIP}')
TCP_INGRESS_PORT=$(kubectl get svc istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="tcp")].port}')

set -eu

SLEEP_POD_NAME=$(kubectl get pod -l app=sleep -n istio-io-tcp-traffic-shifting -o jsonpath={.items..metadata.name})

for i in {1..20}; do
    kubectl exec "$SLEEP_POD_NAME" -c sleep -n istio-io-tcp-traffic-shifting -- sh -c "(date; sleep 1) | nc $INGRESS_HOST $TCP_INGRESS_PORT"; \
done

kubectl config set-context --current --namespace=default  > /dev/null