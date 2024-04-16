.PHONY: install ingress

install:
	@echo "Install CRDs & istiod with kustomize helm"
	@kubectl kustomize --enable-helm base | kubectl apply -f - > /dev/null

ingress:
	@echo "Wait for Istio to be ready"
	@kubectl wait --for=condition=Available deployment/istiod -n istio-system --timeout=300s
	@echo "Install ingress with helm"
	@kubectl kustomize --enable-helm ingress | kubectl apply -f - > /dev/null