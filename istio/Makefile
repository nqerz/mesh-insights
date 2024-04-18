.PHONY: install ingress demo/install demo/uninstall

install:
	@echo "Install CRDs & istiod with kustomize helm"
	@kubectl kustomize --enable-helm base | kubectl apply -f - > /dev/null

uninstall:
	@echo "Install CRDs & istiod with kustomize helm"
	@kubectl kustomize --enable-helm ingress | kubectl delete -f - > /dev/null
	@kubectl kustomize --enable-helm base | kubectl delete -f - > /dev/null


ingress:
	@echo "Wait for Istio to be ready"
	@kubectl wait --for=condition=Available deployment/istiod -n istio-system --timeout=300s
	@echo "Install ingress with helm"
	@kubectl kustomize --enable-helm ingress | kubectl apply -f - > /dev/null

demo/install:
	@echo "Install demo applications"
	@kubectl kustomize --enable-helm demo | kubectl apply -f - > /dev/null

demo/uninstall:
	@echo "Install demo applications"
	@kubectl kustomize --enable-helm demo | kubectl delete -f - > /dev/null
