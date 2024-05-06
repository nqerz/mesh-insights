# Circuit breaking

The source code are from [task/traffic-management/circuit-breaking](https://istio.io/latest/docs/tasks/traffic-management/circuit-breaking/)

The task is using Istio API to replace VirtualService and deploy httpbin services which contains:

- Deploy httpbin service v1 and v2.
- Deploy a sleep service to use curl to provide load.
- Define a destination to both v1 and v2.
- Define a virtual service to route traffic to v1.
- Define a mirroring policy to mirror traffic to v2.

## Steps

1. Apply the Demo appliation, fortio tools and DestinationRule:

   ```bash
   kustomize build . | kubectl apply -f -
   ```

2. Run http test load:

   ```bash
   ./test-provide-httpload.sh
   ```

3. Run traffic test shell:

   ```bash
    # The script will print http code `503` and `200` result.
    # Will print Istio Status at the end.

    ./test-circuit-breaking.sh
   ```

4. Clean up:

   ```bash
   # Comment out step 2 and uncomment step 1
   kustomize build . | kubectl delete -f -
   ```
