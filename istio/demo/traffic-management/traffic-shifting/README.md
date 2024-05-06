# Traffic shifting

The source code are from [task/traffic-management/traffic-shifting](https://istio.io/latest/docs/tasks/traffic-management/traffic-shifting/)

The task is using Istio API to replace VirtualService which contains:

- Route weight for different versions(v1 & v3) of the product page(50% with star and 50% with plaintext).

- Remove old versions(v1) of the product page and keep v3 version.

Test routing by login with user: Jason.

## Steps

1. Comment out step 2 in `Kustomization.yaml` and apply the VirtualService:

   ```bash
   kustomize build . | kubectl apply -f -
   ```

2. Comment out step 1 in `Kustomization.yaml` and apply the VirtualService:

   ```bash
   kustomize build . | kubectl apply -f -
   ```

3. Clean up:

   ```bash
   # Uncomment out and run:
   kustomize build . | kubectl delete -f -
   ```
