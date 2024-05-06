# Request routing

The source code are from [task/traffic-management/request-routing](https://istio.io/latest/docs/tasks/traffic-management/request-routing/)

The task is using Istio API to replace VirtualService which contains:

- A custom "end-user" header to all outbound HTTP requests
- User-based routings to different versions of the same service.

Test routing by login with user: Jason.

## Steps

1. Apply the VirtualService:

   ```bash
   kustomize build . | kubectl apply -f -
   ```

2. Clean up:
   ```bash
   kustomize build . | kubectl delete -f -
   ```
