# TCP Traffic shifting

The source code are from [task/traffic-management/tcp-traffic-shifting](https://istio.io/latest/docs/tasks/traffic-management/tcp-traffic-shifting/)

The task is using Istio API to replace VirtualService which contains:

- Route weight for different versions(v1 & v3) of the product page(50% with star and 50% with plaintext).

## Steps

1. Apply namespace, services and virtualservice:

   ```bash
   kustomize build . | kubectl apply -f -
   kustomize build tcp-echo-shifting | kubectl apply -f -
   ```

2. Run test scripts to test traffic shifting:

   ```bash
   ./tcp-echo-test.sh
   ```

3. Clean up:

   ```bash
   # Uncomment out and run:

   kustomize build tcp-echo-shifting | kubectl delete -f -
   kustomize build . | kubectl delete -f -
   ```
