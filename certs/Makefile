.PHONY: cfssl/generate openssl/generate

cfssl/generate:
	@echo "Generate cfssl certs"
	@cd ./cfssl && ./generate-ca.sh \
		&& kustomize build . | kubectl apply -f - 


openssl/generate:
	@echo "Generate openssl certs"
	@cd ./openssl && ./generate-ca.sh \
		&& kustomize build . | kubectl apply -f - 
