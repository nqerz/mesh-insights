ISTIO_DIR=$(ROOT_DIR)/istio
CERT_DIR=$(ROOT_DIR)/certs

.PHONY: istio/helm-install

##@ Istio Management
istio/helm-install: ## Install istio with helm.
	@make -C $(ISTIO_DIR) install
	@make -C $(ISTIO_DIR) ingress

istio/helm-uninstall: ## Install istio with helm.
	@make -C $(ISTIO_DIR) uninstall

istio/demo-install: ## Install istio demo applications.
	@make -C $(CERT_DIR) cfssl/generate
	@make -C $(ISTIO_DIR) demo/install

istio/demo-uninstall: ## Install istio demo applications.
	@make -C $(ISTIO_DIR) demo/uninstall