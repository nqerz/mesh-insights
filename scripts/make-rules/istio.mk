ISTIO_DIR=$(ROOT_DIR)/istio

.PHONY: istio/helm-install

##@ Istio Management
istio/helm-install: ## Install istio with helm.
	@echo "Install Istio with kustomize helm"
	make -C $(ISTIO_DIR) install
	make -C $(ISTIO_DIR) ingress

