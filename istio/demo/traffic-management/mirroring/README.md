# Mirro

The source code are from [task/traffic-management/mirroring](https://istio.io/latest/docs/tasks/traffic-management/mirroring/)

The task is using Istio API to replace VirtualService and deploy httpbin services which contains:

- Deploy httpbin service v1 and v2.
- Deploy a sleep service to use curl to provide load.
- Define a destination to both v1 and v2.
- Define a virtual service to route traffic to v1.
- Define a mirroring policy to mirror traffic to v2.

## Steps

1. Apply the VirtualService:

   ```bash
   kustomize build . | kubectl apply -f -
   ```

2. Run http test load:

   ```bash
   ./test-provide-httpload.sh
   ```

3. View Pod logs to see the traffic:

   ```bash
   ./test-view-traffic-logs.sh
   ```

4. Comment out step 1 and uncomment step 2 to test mirroring in `kustomization.yaml`:

   ```bash
   kustomize build . | kubectl apply -f -
   ```

5. Run http test load and view Pod logs to see the traffic:

   ```bash
   ./test-provide-httpload.sh
   ./test-view-traffic-logs.sh
   ```

6. Clean up:
   ```bash
   # Comment out step 2 and uncomment step 1
   kustomize build . | kubectl delete -f -
   ```
