# Istio

[Istio Helm Installation](https://istio.io/latest/docs/setup/install/helm/)

## Istio Base

The Istio Base directory contains the necessary components for Istio's control plane, including the Istio CRDs (Custom Resource Definitions) and the Istiod deployment. These components can be installed independently without any specific dependencies or order requirements.

## Istio Ingress

The Istio Ingress directory focuses on the installation of the Istio Ingress Gateway. It is important to note that the installation of the Ingress Gateway should only be performed after the completion of the Istio Base installation. The Ingress Gateway relies on the components installed in the Base directory.

## Istio Demo

The Istio Demo directory provides the official Bookinfo example, which serves as a comprehensive demonstration of Istio's features. It is designed to test and showcase various functionalities of Istio. The Bookinfo example demonstrates how Istio can be used to manage and secure microservices in a distributed application.

Please note that the Istio Demo directory is optional and separate from the core Istio components. It is primarily used for educational and illustrative purposes.

For detailed instructions on how to install Istio using Helm, please refer to the [Istio Helm Installation Guide](https://istio.io/latest/docs/setup/install/helm/).
