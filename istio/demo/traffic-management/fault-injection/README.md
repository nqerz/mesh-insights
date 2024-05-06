# Fault injection

The source code are from [task/traffic-management/fault-injection](https://istio.io/latest/docs/tasks/traffic-management/fault-injection/)

The task is using Istio API to replace VirtualService which contains:

- A custom "end-user" header to all outbound HTTP requests
- User-based routings to different versions of the same service.
- A fault injection to simulate a 100% failure rate of timeout and 500 abort.

Test routing by login with user: Jason.

## Steps

1. Comment out the resources in kustomization.yaml to test different scenarios.
2. Apply the VirtualService:

   ```bash
   kustomize build . | kubectl apply -f -
   ```

3. Clean up:

   ```bash
   # Uncomment out and run:
   kustomize build . | kubectl delete -f -
   ```
