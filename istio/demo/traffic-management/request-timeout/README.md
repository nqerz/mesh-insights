# Request timeouts

The source code are from [task/traffic-management/request-timeouts](https://istio.io/latest/docs/tasks/traffic-management/request-timeouts/)

A `timeout` defines the maximum amount of time an outbound request from a sidecar proxy (Envoy) can wait for a response from a backend service before considering it a failure.

## Steps

1. Apply the VirtualService:

   ```bash
   kustomize build . | kubectl apply -f -
   ```

2. Clean up:
   ```bash
   kustomize build . | kubectl delete -f -
   ```
